import pickle
import sys
import itertools
import pdb
import numpy as np


class Data_wash(object):
    def __init__(self, benchmark_names, paths, inputs, similar_programs):
        self.benchmark_names = benchmark_names
        self.paths = paths
        self.inputs = inputs
        self.similar_programs = similar_programs

    def wash(self):













        pack = self.benchmark_names, self.paths, self.inputs, self.similar_programs
        return pack



        # n_train = len(self.train_input)
        # n_test = len(self.test_input)
        # lb_train = np.where(self.train_label==1)[1]
        # lb_test = np.where(self.test_label==1)[1]
        # print('Train:', n_train, '[',
        #     np.sum(lb_train==0),np.sum(lb_train==1),
        #     np.sum(lb_train==2), ']')
        # print('Test:', n_test, '[',
        #     np.sum(lb_test==0),np.sum(lb_test==1),
        #     np.sum(lb_test==2), ']')
        #
        # km = KMeans(n_clusters=3)
        # km.fit(self.train_input)