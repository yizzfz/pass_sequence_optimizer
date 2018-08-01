import pickle
import sys
import itertools
import pdb
import numpy as np
import random


class Data_saver(object):
    def __init__(self, data):
        self.benchmark_names, self.paths,\
            self.inputs, self.similar_programs = data

    def read_label_file(self, name='cross.pkl'):
        with open(name, 'rb') as f:
            name = pickle.load(f)
            tb = pickle.load(f)

        name = ['../' + n[n.find('workspace'):] for n in name]

        self.cross_tb = [[-255 for _ in range(0, len(name))]
                         for _ in range(0, len(name))]

        for i in range(0, len(name)):
            for j in range(0, len(name)):
                try:
                    ii = name.index(self.paths[i])
                    jj = name.index(self.paths[j])
                    self.cross_tb[i][j] = tb[ii][jj] * 100

                except ValueError:
                    print('Name not match')
                    exit(1)

        for i in range(0, len(self.benchmark_names)):
            s = self.similar_programs[i]
            tb = [] + self.cross_tb[i]
            tb.sort(reverse=1)
            for idx, (pid, v) in enumerate(s):
                assert(v[:8] == str(tb[idx])[:8])

        print('ALL', len(name) * len(name))
        for i in range(-20, 15, 5):
            j = i + 5
            print('Range [', i, ',\t', j, '\t]:\t', len(
                [v for r in self.cross_tb for v in r if v > i and v <= j]))
        print()

    def write_file(self):
        with open('Dict/match_result.pkl', 'wb') as f:
            pickle.dump(self.cross_tb, f)

        with open('Dict/benchname.pkl', 'wb') as f:
            pickle.dump(self.benchmark_names, f)

        with open('Dict/features.pkl', 'wb') as f:
            pickle.dump(self.inputs, f)

    def save(self):
        self.read_label_file()
        self.write_file()
