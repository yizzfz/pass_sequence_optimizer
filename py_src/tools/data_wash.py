import pickle
import sys
import itertools
import pdb
import numpy as np


class Data_wash(object):
    def __init__(self, data):
        self.benchmark_names, self.paths, self.inputs, self.similar_programs = data

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
        # print("所有样本距离聚簇中心点的总距离和:",km.inertia_)
        # print("距离聚簇中心点的平均距离:",(km.inertia_/3))
        # print("聚簇中心点:",km.cluster_centers_)
