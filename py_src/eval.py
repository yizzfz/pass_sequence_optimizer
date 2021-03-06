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
import matplotlib.pyplot as plt
import math
import time


def main():
    data = Data()
    eval_loader = torch.utils.data.DataLoader(
        data.test_dataset, batch_size=1000, shuffle=False)

    model = Net()
    model.load_state_dict(torch.load('Model/nn.mdl'))
    print('Model loaded successfully from Model/nn.mdl')
    final_test(model, eval_loader)


def final_test(model, loader):
    test_idx = read_test_list()
    cross_tb = read_label_file()
    # drawC(cross_tb)
    # return

    model.eval()
    test_loss = 0
    correct = 0
    preds = []
    dtype = torch.FloatTensor
    for data, target in loader:
        data = Variable(data.type(dtype), requires_grad=True)
        target = Variable(target.type(torch.LongTensor))
        t0 = time.time()
        output = model(data)
        t1 = time.time()
        # get the index of the max log-probability
        pred = output.max(1, keepdim=True)[1]
        preds += output.tolist()
        correct += pred.eq(target.data.view_as(pred)).cpu().sum()

    print('Test set Accuracy: {}/{} ({:.0f}%)\n'.format(
        correct, len(loader.dataset),
        100. * correct / len(loader.dataset)))

    assert(len(preds) == len(loader.dataset))

    res = dict()
    for i in range(0, len(loader.dataset)):
        new, old = test_idx[i]
        if new not in res:
            res[new] = []
        if preds[i][0] > 1 / 3:
            res[new].append((preds[i][0], old))
        res[new].sort(reverse=1)

    timed_res = []
    drawall = 0
    for newprogram, val in res.items():
        print(newprogram, ': ', [(cross_tb[newprogram][oldprogram])
                                 for confidence, oldprogram in val[:5]])
        if val[:3] != [] or drawall:
            timed_res.append((newprogram, [
                (cross_tb[newprogram][oldprogram])
                if cross_tb[newprogram][oldprogram] != -25500
                else 0
                for confidence, oldprogram in val[:3]
            ]))
    # if drawall:
    #     draw3(timed_res)
    # else:
    #     draw2(timed_res)
    #
    draw_compile_time(timed_res, t1 - t0)


def read_time():
    with open('../compile_time.pkl', 'rb') as f:
        time = pickle.load(f)
    time_dict = {}
    for name, o3, ra in time:
        time_dict[name] = (o3, ra)
    return time_dict


def draw_compile_time(nn_res, nn_time):
    print(nn_res)
    length = len(nn_res)
    fig, ax = plt.subplots()
    data = read_data()
    ct = read_time()
    programs = [p for p, _ in nn_res]
    times = [t[:3] for _, t in nn_res]

    bar_nn = []
    bar_o3 = []
    bar_opt = []
    bar_pro = []
    bar_t3_opt = []
    bar_t3_ver = []
    program_ids = []
    for i, program_id in enumerate(programs):
        name = shorten(data[program_id][1])
        O3time = float(data[program_id][3][0])
        NN_verify = sum([O3time / (r / 100 + 1) for r in times[i]])

        opt = ct[name][1]
        opt = opt/10 if opt > 1 else opt
        o3 = ct[name][0]
        o3 = o3/10 if o3 > 1 else o3
        bar_nn.append(nn_time)
        bar_o3.append(o3)
        bar_opt.append(opt)
        bar_pro.append(O3time)
        bar_t3_opt.append(opt*3)
        bar_t3_ver.append(NN_verify)
        program_ids.append(data[program_id][0])

    bar_o3 += [np.average(bar_o3), geomean(bar_o3)]
    bar_opt += [np.average(bar_opt), geomean(bar_opt)]
    bar_nn += [np.average(bar_nn), geomean(bar_nn)]
    bar_t3_opt += [np.average(bar_t3_opt), geomean(bar_t3_opt)]
    bar_t3_ver += [np.average(bar_t3_ver), geomean(bar_t3_ver)]
    bar_pro += [np.average(bar_pro), geomean(bar_pro)]

    program_ids.append('Mean')
    program_ids.append('Geo Mean')

    program_ids = [c[c.find('-') + 1:] for c in program_ids]
    program_ids = [c[15:] if 'linear-' in c else c for c in program_ids]
    ind = np.arange(1, len(program_ids) + 1)
    width = 0.25
    opacity = 0.4

    top = 3
    if top == 1:
        ax.bar(ind + width * 0, bar_o3, width, label='O3 Compile',
               alpha=opacity)
        ax.bar(ind + width * 1, bar_opt, width, label='NN-Top1',
               alpha=opacity)
        ax.bar(ind + width * 1, bar_pro, width, label='Profile',
               alpha=opacity, bottom=bar_opt)
        ax.bar(ind + width * 1, bar_nn, width, label='NN Inference',
               alpha=opacity, bottom=[a+b for a, b in zip(bar_opt, bar_pro)])
    else:
        ax.bar(ind + width * 0, bar_o3, width, label='O3 Compile',
               alpha=opacity)
        ax.bar(ind + width * 1, bar_t3_opt, width, label='NN-Top3',
               alpha=opacity)
        ax.bar(ind + width * 1, bar_pro, width, label='Profile',
               alpha=opacity, bottom=bar_t3_opt)
        ax.bar(ind + width * 1, bar_t3_ver, width, label='Match Verify',
               alpha=opacity, bottom=[a+b for a, b in zip(bar_t3_opt,
               bar_pro)])
        ax.bar(ind + width * 1, bar_nn, width, label='NN Inference',
               alpha=opacity, bottom=[a+b+c for a, b, c in zip(bar_t3_ver,
               bar_t3_opt, bar_pro)])

    ax.set_ylabel('Compilation Time (s)')
    # ax.set_xlabel('Test Set')
    ax.set_xticks(ind+0.5*width)
    ax.set_xticklabels(program_ids, rotation=80)
    ax.legend()
    plt.tight_layout()
    plt.show()

    cmd = input('save?\n')
    if cmd != '':
        fig.savefig('./Figure/' + cmd)


def drawC(tb):
    fig, ax = plt.subplots()
    data = read_data()

    for i in range(0, len(tb)):
        for j in range(i + 1, len(tb)):
            if tb[i][j] > 0 and tb[j][i] > 0:
                ax.plot(i, j, 'o', c='red')
            elif tb[i][j] > 0:
                ax.plot(i, j, 'o', c='blue')
            elif tb[j][i] > 0:
                ax.plot(i, j, 'o', c='green')

    plt.tight_layout()
    plt.show()


def draw3(nn_res):
    print(nn_res)
    length = len(nn_res)
    fig, ax = plt.subplots()
    data = read_data()
    programs = [p for p, _ in nn_res]

    z2 = [max(res) if len(res) > 0 else -255 for _, res in nn_res]

    bar1 = []
    bar2 = []
    bar3 = []
    bar4 = []
    program_ids = []
    for i, program_id in enumerate(programs):
        O3time = float(data[program_id][3][0])
        O0time = float(data[program_id][2][2])
        GAtime = O3time
        if(data[program_id][4] is not None):
            GAtime = float(data[program_id][4][0])
        O0time = O3time if O0time < O3time else O0time
        NN_best = O3time / (z2[i] / 100 + 1) if z2[i] != -255 else GAtime

        bar1.append(O0time)
        bar2.append(O3time)
        bar3.append(NN_best)
        bar4.append(GAtime)
        program_ids.append(data[program_id][0])
        if program_id in [49, 81, 90, 103]:
            print(O0time, O3time, NN_best, GAtime, z2[i])

    bar1 += [np.average(bar1), geomean(bar1)]
    bar2 += [np.average(bar2), geomean(bar2)]
    bar3 += [np.average(bar3), geomean(bar3)]
    bar4 += [np.average(bar4), geomean(bar4)]
    program_ids.append('Mean')
    program_ids.append('Geo Mean')

    # pdb.set_trace()
    print('avg time:', (bar2[-2] - bar3[-2]),
          'avg%:', (bar2[-2] - bar3[-2]) / bar3[-2])

    print('avg time:', (bar1[-1] - bar3[-1]),
          'avg%:', (bar1[-1] - bar3[-1]) / bar1[-1])

    print('geo time:', (bar2[-1] - bar3[-1]),
          'geo%:', (bar2[-1] - bar3[-1]) / bar3[-1])

    program_ids = [c[c.find('-') + 1:] for c in program_ids]
    program_ids = [c[15:] if 'linear-' in c else c for c in program_ids]
    ind = np.arange(1, len(program_ids) + 1)
    width = 0.2
    opacity = 0.4

    ax.bar(ind + width * 0, bar1, width, label='O0', alpha=opacity)
    ax.bar(ind + width * 1, bar2, width, label='O3', alpha=opacity)
    ax.bar(ind + width * 2, bar3, width, label='Optimized', alpha=opacity)
    # ax.bar(ind+width*3, bar4, width, label='GA', alpha=opacity)

    ax.set_ylabel('Exection Time (s)')
    ax.set_xlabel('Test Set')
    ax.set_xticks(ind + width * 1)
    ax.set_xticklabels(program_ids, rotation=80)
    plt.tight_layout()
    # plt.tight_layout(rect=[0, 0, 1, 0.9])
    # ax.legend(loc=1, bbox_to_anchor=(1, 1.35))
    ax.legend(loc=1)
    plt.show()

    cmd = input('save?\n')
    if cmd != '':
        fig.savefig('./Figure/' + cmd)


def draw2(nn_res):
    print(nn_res)
    length = len(nn_res)
    fig, ax = plt.subplots()
    data = read_data()
    rand = read_rand()

    programs = [p for p, _ in nn_res]

    nn_top3 = [max(res) if len(res) > 0 else 0 for _, res in nn_res]
    nn_top1 = [res[0] if len(res) > 0 else 0 for _, res in nn_res]

    bar1 = []
    bar2 = []
    bar3 = []
    bar4 = []
    bar5 = []
    program_ids = []
    for i, program_id in enumerate(programs):
        O3time = float(data[program_id][3][0])
        O0time = float(data[program_id][2][2])
        GAtime = O3time
        if(data[program_id][4] is not None):
            GAtime = float(data[program_id][4][0])
        O0time = O3time if O0time < O3time else O0time
        nn_top3_t = O3time / (nn_top3[i] / 100 + 1)
        nn_top1_t = O3time / (nn_top1[i] / 100 + 1)
        ra, _, _ = rand[shorten(data[program_id][1])]

        bar1.append(O0time)
        bar2.append(O3time)
        bar3.append(nn_top3_t)
        bar4.append(nn_top1_t)
        bar5.append(np.average(ra))
        program_ids.append(data[program_id][0])

    bar1 += [np.average(bar1), geomean(bar1)]
    bar2 += [np.average(bar2), geomean(bar2)]
    bar3 += [np.average(bar3), geomean(bar3)]
    bar4 += [np.average(bar4), geomean(bar4)]
    bar5 += [np.average(bar5), geomean(bar5)]

    program_ids.append('Mean')
    program_ids.append('Geo Mean')

    # pdb.set_trace()
    calc_imp(bar2, bar3, 'top3-O3')
    calc_imp(bar1, bar3, 'top3-O0')
    calc_imp(bar2, bar4, 'top1-O3')
    calc_imp(bar1, bar4, 'top1-O0')
    calc_imp(bar5, bar3, 'top3-ra')
    calc_imp(bar5, bar4, 'top1-ra')

    program_ids = [c[c.find('-') + 1:] for c in program_ids]
    program_ids = [c[15:] if 'linear-' in c else c for c in program_ids]
    ind = np.arange(1, len(program_ids) + 1)
    width = 0.15
    opacity = 0.4

    ax.bar(ind + width * 0, bar1, width, label='O0', alpha=opacity)
    ax.bar(ind + width * 1, bar2, width, label='O3', alpha=opacity)
    ax.bar(ind + width * 2, bar3, width, label='NN-top3', alpha=opacity)
    ax.bar(ind + width * 3, bar4, width, label='NN-top1', alpha=opacity)
    ax.bar(ind + width * 4, bar5, width, label='Random', alpha=opacity)

    ax.set_ylabel('Exection Time (s)')
    ax.set_xticks(ind + width * 2)
    ax.set_xticklabels(program_ids, rotation=75)
    plt.tight_layout()
    # plt.tight_layout(rect=[0, 0, 1, 0.9])
    # ax.legend(loc=1, bbox_to_anchor=(1, 1.35))
    ax.legend(loc=1)
    plt.show()

    cmd = input('save?\n')
    if cmd != '':
        fig.savefig('./Figure/' + cmd)


def calc_imp(bar1, bar2, text=''):
    print(text, 'time {:.2f}, {:.2f}%'.format((bar1[-1] - bar2[-1]),
          (bar1[-1] - bar2[-1])*100 / bar1[-1]))


def draw1(nn_res):
    print(nn_res)
    length = len(nn_res)
    fig, ax = plt.subplots()
    data = read_data()
    programs = [p for p, _ in nn_res]

    z1 = [min(res) if len(res) > 0 else 0 for _, res in nn_res]
    z2 = [max(res) if len(res) > 0 else 0 for _, res in nn_res]
    z3 = [np.average(res) if len(res) > 0 else 0 for _, res in nn_res]

    bar1 = []
    bar2 = []
    bar3 = []
    bar4 = []
    program_ids = []
    for i, program_id in enumerate(programs):
        O3time = float(data[program_id][3][0])
        O0time = float(data[program_id][2][2])
        GAtime = O3time
        if(data[program_id][4] is not None):
            GAtime = float(data[program_id][4][0])
        O0time = O3time if O0time < O3time else O0time
        NN_best = O3time / (z2[i] / 100 + 1)
        NN_avg = O3time / (z3[i] / 100 + 1)

        # NN_best_to_O0 = (O0time-NN_best)*100/O0time
        # NN_avg_to_O0 = (O0time-NN_avg)*100/O0time
        # O3_to_O0 = (O0time-O3time)*100/O0time
        # GA_to_O0 = (O0time-GAtime)*100/O0time
        NN_best_to_O0 = (O0time / NN_best)
        NN_avg_to_O0 = (O0time / NN_avg)
        O3_to_O0 = (O0time / O3time)
        GA_to_O0 = (O0time / GAtime)

        bar1.append(O3_to_O0)
        bar2.append(NN_best_to_O0)
        bar3.append(NN_avg_to_O0)
        bar4.append(GA_to_O0)
        program_ids.append(data[program_id][0])

    bar1 += [np.average(bar1), geomean(bar1)]
    bar2 += [np.average(bar2), geomean(bar2)]
    bar3 += [np.average(bar3), geomean(bar3)]
    bar4 += [np.average(bar4), geomean(bar4)]
    program_ids.append('Mean')
    program_ids.append('Geo Mean')

    program_ids = [c[c.find('-') + 1:] for c in program_ids]
    program_ids = [c[15:] if 'linear-' in c else c for c in program_ids]
    ind = np.arange(1, len(program_ids) + 1)
    width = 0.15
    opacity = 0.4

    ax.bar(ind + width * 0, bar1, width, label='O3', alpha=opacity)
    ax.bar(ind + width * 1, bar2, width, label='NN', alpha=opacity)
    # ax.bar(ind+width*2, bar3, width, label='NN_Avg', alpha=opacity)
    ax.bar(ind + width * 2, bar4, width, label='GA', alpha=opacity)

    ax.set_ylabel('Performance to O0 (Ratio)')
    # ax.set_xlabel('Test Set')
    ax.set_xticks(ind + width * 1)
    ax.set_xticklabels(program_ids, rotation=60)
    plt.tight_layout()
    # plt.tight_layout(rect=[0, 0, 1, 0.9])
    # ax.legend(loc=1, bbox_to_anchor=(1, 1.35))
    ax.legend(loc=1)
    plt.show()

    cmd = input('save?\n')
    if cmd != '':
        fig.savefig('./Figure/' + cmd)


def geomean(l):
    a = np.array(l)
    res = a.prod()**(1.0 / len(a))
    return res


def read_data(name='data.pkl'):
    with open(name, 'rb') as f:
        raw_data = pickle.load(f)
        f.close()
    return raw_data


def read_rand(name='rand.pkl'):
    with open(name, 'rb') as f:
        rand = pickle.load(f)
    return rand


def read_label_file(name='Data/cross_tb.pkl'):
    with open(name, 'rb') as f:
        cross_tb = pickle.load(f)
    return cross_tb


def read_test_list():
    with open('Data/test_idx.pkl', 'rb') as f:
        test_idx = pickle.load(f)
    return test_idx


class Data(object):
    def __init__(self, directory='./Data/'):
        self.wrap_data(directory)

    def wrap_data(self, directory):
        test_data = pickle.load(open(directory + 'test_input.pkl', 'rb'))
        test_label = pickle.load(open(directory + 'test_label.pkl', 'rb'))
        self.test_dataset = self._wrap_to_dataset(test_data, test_label)

    def _wrap_to_dataset(self, data, label, train=False):
        '''
        [1, 0, 0] -> 0
        [0, 1, 0] -> 1
        [0, 0, 1] -> 2
        '''
        data = self._wrap_to_tensor(data)
        label = np.where(label > 0)[1]

        if(train):
            self.class_weight = [1 / np.sum(label == i) for i in range(0, 3)]
            self.class_weight = [i / min(self.class_weight)
                                 for i in self.class_weight]
            print('Class Distribution', [
                  np.sum(label == i) for i in range(0, 3)])
            print('Class Weight', self.class_weight)
            print('\n\n\n')

        label = self._wrap_to_tensor(label)
        return torch.utils.data.TensorDataset(data, label)

    def _wrap_to_tensor(self, np_data):
        return torch.from_numpy(np_data)


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
        # x = F.relu(self.fc3(x))
        # x = F.relu(self.fc4(x))
        x = F.relu(self.fc5(x))
        # x = F.relu(self.fc6(x))
        x = self.fc7(x)
        return F.softmax(x, dim=1)

    def checkNaN(self, x, s=''):
        if(np.any(np.isnan(x.cpu().detach().numpy()))):
            print('Found nan', s)
            exit(1)


def shorten(s):
    if 'workspace' in s:
        return s[s.find('workspace') + 9:]
    else:
        return s

if __name__ == '__main__':
    main()
