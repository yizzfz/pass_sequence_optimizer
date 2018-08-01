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


def main(args):
    data = Data()
    import pdb; pdb.set_trace()
    exit()

    # if args.balanced else Data('./Data/backup/')
    batch_size = args.batch_size
    # in case we need gpus
    kwargs = {'num_workers': 1, 'pin_memory': True} if args.cuda else {}
    train_loader = torch.utils.data.DataLoader(
        data.train_dataset, batch_size=batch_size, shuffle=True, **kwargs)
    eval_loader = torch.utils.data.DataLoader(
        data.test_dataset, batch_size=batch_size, shuffle=True, **kwargs)
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
    for epoch in range(1, args.epochs + 1):
        train(epoch, model, train_loader, args, class_weight)
        test(model, eval_loader, args)

    if args.save:
        if args.cuda:
            model = model.to('cpu')
        torch.save(model.state_dict(), 'Model/nn.mdl')
        print('Model Saved to Model/nn.mdl')


def printlog():
    # \x1b[3A = move cursor up 3 lines
    # \x1b[2K = clear stdout from cursor
    print('\x1b[3A\x1b[2K\r', end='')
    print(' ' * 100)
    print(' ' * 100)
    print(' ' * 100)
    print('\x1b[3A\x1b[2K\r', end='')
    print(printstr1)
    print(printstr2)
    print(printstr3)


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

    #         print('Train Epoch: {} [{}/{} ({:.0f}%)]\tLoss: {:.6f}\t'.format(
    #             epoch, batch_idx * len(data), len(train_loader.dataset),
    #             100. * batch_idx / len(train_loader), loss.item()))
    #
    # print('Train Epoch: {} Acc: {:.1f}'.format(
    #     epoch, 100.*correct/len(train_loader.dataset)))
    printstr2 = 'Train Epoch: {} Acc: {:.1f}'.format(
        epoch, 100. * correct / len(train_loader.dataset))
    printlog()


def test(model, loader, args):
    global printstr3
    model.eval()
    test_loss = 0
    correct = 0
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
        correct += pred.eq(target.data.view_as(pred)).cpu().sum()

    test_loss /= len(loader.dataset)
    printstr3 = \
        'Test set: Average loss: {:.4f}, Accuracy: {}/{} ({:.0f}%)'.format(
            test_loss, correct, len(loader.dataset),
            100. * correct / len(loader.dataset))
    printlog()


class Data(object):
    def __init__(self, file_name='./Dict/', balanced=True):
        self.names = self._load(file_name + 'benchname.pkl')
        self.features = self._load(file_name + 'features.pkl')
        self.results = self._load(file_name + 'match_result.pkl')
        self.step = 0
        self.data_pool = []
        self._threshold = 2.5
        self.ids = list(*range(len(self.names)))
        self.training_set_ids = []
    
    def _result_to_label(self, result):
        if result > self._threshold:
            return [1, 0, 0]
        elif result <= self._threshold and result >= -self._threshold:
            return [0, 1, 0]
        else:
            return [0, 0, 1]

    def _load(self, file_name):
        if not os.path.isfile(file_name):
            raise ValueError('data file not found')
        return pickle.load(open(file_name, 'rb'))
    
    def test_data_feed(self):
        self.id = self.ids.pop()
        # self.training_set_ids.append(id)
        test_data = {
            'input': [],
            'label': [],
        }
        for t_id in self.training_set_ids:
            test_data['input'].append(
                self.features[t_id] + self.features[self.id])
            test_data['label'].append(
                self._result_to_label(self.results[t_id, self.id]))
        return test_data
    
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
                        self.features[t_id] + self.features[self.t_id2])
                    train_data['label'].append(
                        self._result_to_label(self.results[t_id, self.t_id2]))
        return train_data


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
        '--epochs', type=int, default=500, metavar='N',
        help='number of epochs to train (default: 500)')
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
    main(args)
