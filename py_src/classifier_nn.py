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


def main(args):
    data = Data()
    batch_size = args.batch_size
    # in case we need gpus
    kwargs = {'num_workers': 1, 'pin_memory': True} if args.cuda else {}
    train_loader = torch.utils.data.DataLoader(
        data.train_dataset, batch_size=batch_size, shuffle=True, **kwargs)
    eval_loader = torch.utils.data.DataLoader(
        data.test_dataset, batch_size=batch_size, shuffle=True, **kwargs)
    model = Net()
    if args.cuda:
        model.cuda()
    for epoch in range(1, args.epochs+1):
        train(epoch, model, train_loader, args)
        test(model, eval_loader, args)


def train(epoch, model, train_loader, args):
    optimizer = optim.SGD(model.parameters(), lr=args.lr)
    model.train()
    dtype = torch.FloatTensor
    criterion = torch.nn.CrossEntropyLoss()
    for batch_idx, (data, target) in enumerate(train_loader):
        if args.cuda:
            data, target = data.cuda(), target.cuda()
        data = Variable(data.type(dtype), requires_grad=True)
        target = Variable(target.type(torch.LongTensor))
        optimizer.zero_grad()
        output = model(data)
        loss = criterion(output, target)
        loss.backward()
        optimizer.step()
        if batch_idx % args.log_interval == 0:
            print('Train Epoch: {} [{}/{} ({:.0f}%)]\tLoss: {:.6f}'.format(
                epoch, batch_idx * len(data), len(train_loader.dataset),
                100. * batch_idx / len(train_loader), loss.data[0]))


def test(model, loader, args):
    model.eval()
    test_loss = 0
    correct = 0
    dtype = torch.FloatTensor
    for data, target in loader:
        if args.cuda:
            data, target = data.cuda(), target.cuda()
        data = Variable(data.type(dtype), requires_grad=True)
        target = Variable(target.type(torch.LongTensor))
        output = model(data)
        # sum up batch loss
        test_loss += F.nll_loss(output, target, size_average=False).data[0]
        # get the index of the max log-probability
        pred = output.data.max(1, keepdim=True)[1]
        correct += pred.eq(target.data.view_as(pred)).cpu().sum()

    test_loss /= len(loader.dataset)
    print('\nTest set: Average loss: {:.4f}, Accuracy: {}/{} ({:.0f}%)\n'.format(
        test_loss, correct, len(loader.dataset),
        100. * correct / len(loader.dataset)))


class Data(object):
    def __init__(self, directory='./data/'):
        self.wrap_data(directory)

    def wrap_data(self, directory):
        train_data = pickle.load(open(directory + 'train_input.pkl', 'rb'))
        train_label = pickle.load(open(directory + 'train_label.pkl', 'rb'))
        self.train_dataset = self._wrap_to_dataset(train_data, train_label)

        test_data = pickle.load(open(directory + 'test_input.pkl', 'rb'))
        test_label = pickle.load(open(directory + 'test_label.pkl', 'rb'))
        self.test_dataset = self._wrap_to_dataset(test_data, test_label)

    def _wrap_to_dataset(self, data, label):
        data = self._wrap_to_tensor(data)
        label = np.where(label > 0)[1]
        label = self._wrap_to_tensor(label)
        return torch.utils.data.TensorDataset(data, label)

    def _wrap_to_tensor(self, np_data):
        return torch.from_numpy(np_data)


class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.fc1 = nn.Linear(310, 200)
        self.fc2 = nn.Linear(200, 500)
        self.fc3 = nn.Linear(500, 500)
        self.fc4 = nn.Linear(500, 100)
        self.fc5 = nn.Linear(100, 3)

    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = F.dropout(x, training=self.training)
        x = self.fc2(x)
        x = F.dropout(x, training=self.training)
        x = self.fc3(x)
        x = F.dropout(x, training=self.training)
        x = self.fc4(x)
        x = self.fc5(x)
        return F.log_softmax(x)


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
        help='number of epochs to train (default: 10)')
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
        '--log-interval', type=int, default=10, metavar='N',
        help='how many batches to wait before logging training status')
    args = parser.parse_args()
    # turn on cuda if you can
    args.cuda = torch.cuda.is_available()
    main(args)
