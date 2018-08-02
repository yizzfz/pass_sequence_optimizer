from __future__ import print_function
import argparse
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
from torchvision import datasets, transforms
from torch.autograd import Variable
import numpy as np
import pickle
import pdb
import random
import os

printstr1 = ''
printstr2 = ''
printstr3 = ''
printstr4 = ''


def main(args):
    global printstr4
    data = Data()

    # if args.balanced else Data('./Data/backup/')
    batch_size = args.batch_size
    # in case we need gpus
    kwargs = {'num_workers': 1, 'pin_memory': True} if args.cuda else {}

    model = Net()
    if args.load:
        model.load_state_dict((torch.load('Model/nn.mdl')))
        print('Model loaded successfully from Model/nn.mdl')

    class_weight = torch.tensor([1.0, 1.0, 1.0])
    if args.balanced is False:
        class_weight = torch.tensor(data.class_weight)
    if args.cuda:
        model.cuda()
        class_weight = class_weight.cuda()

    true_positives = 0
    passed = []
    for i in range(0, 110):
        n_train = len(data.training_set_ids)
        test_set = data.test_data_feed()

        if n_train > 2 and test_set != []:
            eval_loader = torch.utils.data.DataLoader(
                test_set, batch_size=batch_size, shuffle=True, **kwargs)
            true_positives = test(model, eval_loader, args)
            if true_positives > 0:
                passed.append(data.id)

        if true_positives <= 0:
            train_set = data.add_train_data()
            train_loader = torch.utils.data.DataLoader(
                train_set, batch_size=batch_size, shuffle=True, **kwargs)

            for epoch in range(1, args.epochs + 1):
                train(epoch, model, train_loader, args, class_weight)

        n_train = len(data.training_set_ids)
        n_unseen = len(data.ids)
        n_passed = len(passed)
        printstr4 = 'No. Train: ' + str(n_train) +\
                    ',\t No. Unseen: ' + str(n_unseen) +\
                    ',\t No. Passed: ' + str(n_passed)
        printlog()

    print('Programs included in system:', data.training_set_ids)
    print('Programs predicted successfully:', passed)
    if args.save:
        if args.cuda:
            model = model.to('cpu')
        torch.save(model.state_dict(), 'Model/nn.mdl')
        print('Model Saved to Model/nn.mdl')


def printlog():
    # \x1b[3A = move cursor up 3 lines
    # \x1b[2K = clear stdout from cursor
    print('\x1b[4A\x1b[2K\r', end='')
    print(' ' * 100)
    print(' ' * 100)
    print(' ' * 100)
    print(' ' * 100)
    print('\x1b[4A\x1b[2K\r', end='')
    print(printstr1)
    print(printstr2)
    print(printstr3)
    print(printstr4)


def train(epoch, model, train_loader, args, class_weight):
    global printstr1, printstr2, printstr3
    optimizer = optim.Adam(model.parameters(), lr=args.lr, weight_decay=1e-4)
    model.train()
    dtype = torch.FloatTensor
    criterion = torch.nn.CrossEntropyLoss(weight=class_weight)
    correct = 0
    for batch_idx, (data, target) in enumerate(train_loader):
        data = Variable(data.type(dtype), requires_grad=True)
        target = Variable(target.type(torch.LongTensor))
        if args.cuda:
            data, target = data.cuda(), target.cuda()
        optimizer.zero_grad()
        output = model(data)
        loss = criterion(output, target)
        loss.backward()
        optimizer.step()

        pred = output.data.max(1, keepdim=True)[1]
        correct += pred.eq(target.data.view_as(pred)).cpu().sum()

        if batch_idx % args.log_interval == 0:
            printstr1 = \
                'Train Epoch: {} [{}\t/{} ({:.0f}%)] \tLoss: {:.6f}'.format(
                    epoch, batch_idx * len(data), len(train_loader.dataset),
                    100. * batch_idx / len(train_loader), loss.item())
            printlog()

    printstr2 = 'Train Epoch: {} Acc: {:.1f}'.format(
        epoch, 100. * correct / len(train_loader.dataset))
    printlog()


def test(model, loader, args):
    global printstr3
    model.eval()
    test_loss = 0
    correct = 0
    true_positives = 0
    dtype = torch.FloatTensor
    for data, target in loader:
        data = Variable(data.type(dtype), requires_grad=True)
        target = Variable(target.type(torch.LongTensor))
        if args.cuda:
            data, target = data.cuda(), target.cuda()
        output = model(data)
        # sum up batch loss
        test_loss += F.nll_loss(output, target, size_average=False).item()
        # get the index of the max log-probability
        pred = output.data.max(1, keepdim=True)[1]
        pred = pred.reshape(len(target))
        correct += pred.eq(target).cpu().sum()
        true_positives += ((target == pred) * (target == 0)).float().sum()

    test_loss /= len(loader.dataset)
    printstr3 = \
        'Test set: Average loss: {:.4f}, Accuracy: {}/{} ({:.0f}%), True positive: {}'.format(
            test_loss, correct, len(loader.dataset),
            100. * correct / len(loader.dataset), true_positives)
    printlog()
    return int(true_positives)


class Data(object):
    def __init__(self, file_name='./Dict/', balanced=True, random=True):
        self.names = self._load(file_name + 'benchname.pkl')
        self.features = self._load(file_name + 'features.pkl')
        self.results = self._load(file_name + 'match_result.pkl')
        self.step = 0
        self.data_pool = []
        self._threshold = 2.5
        self.ids = list(range(len(self.names)))
        # random shuffle
        if random:
            self.ids = self._list_shuffle(self.ids)
        self.training_set_ids = []

        # need at least two programs in training set
        self.training_set_ids.append(self.ids.pop())
        self.training_set_ids.append(self.ids.pop())

    def _list_shuffle(self, xs):
        xs = [[x] for x in xs]
        random.shuffle(xs)
        return [x[0] for x in xs]

    def _result_to_label(self, result):
        # if result > self._threshold:
        #     return [1, 0, 0]
        # elif result <= self._threshold and result >= -self._threshold:
        #     return [0, 1, 0]
        # else:
        #     return [0, 0, 1]
        if result > self._threshold:
            return 0
        elif result <= self._threshold and result >= -self._threshold:
            return 1
        else:
            return 2

    def _load(self, file_name):
        if not os.path.isfile(file_name):
            raise ValueError('data file not found')
        return pickle.load(open(file_name, 'rb'))

    def test_data_feed(self):

        if self.training_set_ids == [] or self.ids == []:
            return []

        self.id = self.ids.pop()
        # self.training_set_ids.append(id)
        test_data = {
            'input': [],
            'label': [],
        }

        for t_id in self.training_set_ids:
            test_data['input'].append(
                np.append(self.features[self.id], self.features[t_id]))
            test_data['label'].append(
                self._result_to_label(self.results[self.id][t_id]))
        return self._create_dataset(test_data)

    def add_train_data(self):
        # add to the list
        self.training_set_ids.append(self.id)
        # reconstruct traning set
        train_data = {
            'input': [],
            'label': [],
        }
        for t_id in self.training_set_ids:
            for t_id2 in self.training_set_ids:
                if t_id != t_id2:
                    train_data['input'].append(
                        np.append(self.features[t_id], self.features[t_id2]))
                    train_data['label'].append(
                        self._result_to_label(self.results[t_id][t_id2]))
        return self._create_dataset(train_data)

    def _create_dataset(self, meta_dict):
        tensor_x = np.array(meta_dict['input'])
        tensor_y = np.array(meta_dict['label'])
        return torch.utils.data.TensorDataset(torch.from_numpy(tensor_x),
                                              torch.from_numpy(tensor_y))


class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.fc1 = nn.Linear(330, 500)
        self.fc2 = nn.Linear(500, 500)
        self.fc5 = nn.Linear(500, 200)
        self.fc7 = nn.Linear(200, 3)

    def forward(self, x):

        x = F.relu(self.fc1(x))
        x = F.dropout(x, training=self.training)
        x = F.relu(self.fc2(x))
        x = F.dropout(x, training=self.training)

        # x = F.relu(self.fc3(x))
        # x = F.relu(self.fc4(x))
        x = F.relu(self.fc5(x))
        x = F.dropout(x, training=self.training)

        # x = F.relu(self.fc6(x))
        x = self.fc7(x)

        # state = self.state_dict()
        # print(state['fc1.weight'])

        return F.log_softmax(x, dim=1)

    def checkNaN(self, x, s=''):
        if(np.any(np.isnan(x.cpu().detach().numpy()))):
            print('Found nan', s)
            exit(1)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Pass sequence classifier')
    parser.add_argument(
        '--batch-size', type=int, default=64, metavar='N',
        help='input batch size for training (default: 64)')
    parser.add_argument(
        '--test-batch-size', type=int, default=1000, metavar='N',
        help='input batch size for testing (default: 1000)')
    parser.add_argument(
        '--epochs', type=int, default=100, metavar='N',
        help='number of epochs to train (default: 100)')
    parser.add_argument(
        '--lr', type=float, default=0.001, metavar='LR',
        help='learning rate (default: 0.001)')
    parser.add_argument(
        '--momentum', type=float, default=0.5, metavar='M',
        help='SGD momentum (default: 0.5)')
    parser.add_argument(
        '--no-cuda', action='store_true', default=False,
        help='disables CUDA training')
    parser.add_argument(
        '--log-interval', type=int, default=20, metavar='N',
        help='how many batches to wait before logging training status')
    parser.add_argument(
        '--balanced', type=lambda x: (str(x).lower() == 'true'),
        default=True, required=False, help='pick balanced dataset or not')
    parser.add_argument(
        '--save', action='store_true', default=False, required=False,
        help='load a trained model')
    parser.add_argument(
        '--load', action='store_true', default=False, required=False,
        help='save the model after training')
    args = parser.parse_args()
    # turn on cuda if you can
    args.cuda = torch.cuda.is_available()
    if args.cuda:
        print('using CUDA')
    print('learning rate', args.lr)
    print('\n\n\n\n')
    main(args)
