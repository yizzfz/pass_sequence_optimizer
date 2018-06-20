import pickle
import sys
import itertools
import pdb
import numpy as np
import random

test_random = True
test_M=[2, 9, 11, 25, 22, 30, 37, 45, 52, 33]

class Data_generate(object):
    def __init__(self, data):
        self.benchmark_names, self.paths, self.inputs, self.similar_programs = data


    def read_label_file(self, name='cross.pkl'):
        with open(name, 'rb') as f:
            name = pickle.load(f)
            tb = pickle.load(f)

        name = ['../'+n[n.find('workspace'):] for n in name]

        self.cross_tb = [[-255 for _ in range(0, len(name))] for _ in range(0, len(name))]
        for i in range(0, len(name)):
            for j in range(0, len(name)):
                try:
                    ii = name.index(self.paths[i])
                    jj = name.index(self.paths[j])
                    self.cross_tb[i][j] = tb[ii][jj]*100

                except ValueError:
                    print('Name not match')
                    exit(1)


        for i in range(0, len(self.benchmark_names)):
            s = self.similar_programs[i]
            tb = []+self.cross_tb[i]
            tb.sort(reverse=1)
            for idx,(pid,v) in enumerate(s):
                assert(v[:8]==str(tb[idx])[:8])

        print('ALL', len(name)*len(name))
        for i in range(-20,15,5):
            j=i+5
            print('Range [',i,',\t',j,'\t]:\t', len([v for r in self.cross_tb for v in r if v>i and v<=j]))
        print()



    def write_file(self):
        with open('Data/train_input.pkl', 'wb') as f1:
            pickle.dump(self.train_input, f1)

        with open('Data/train_label.pkl', 'wb') as f2:
            pickle.dump(self.train_label, f2)

        with open('Data/test_input.pkl', 'wb') as f3:
            pickle.dump(self.test_input, f3)

        with open('Data/test_label.pkl', 'wb') as f4:
            pickle.dump(self.test_label, f4)

        with open('Data/test_idx.pkl', 'wb') as f5:
            pickle.dump(self.test_data_list, f5)

        # with open('Data/n.txt', 'w') as f6:
        #     f6.write(str(self.N))


    def generate(self):
        self.read_label_file()
        """
        NN input = (N^N, M*2), NN output = (N^N, 3)
        N = number of programs = 55
        M = number of features = 155
        NTrain = number of training programs = 45
        NTest = number of test progrmas = 10
        number of training data = NTrain*NTrain-NTrain
        number of test data = Ntest*N-Ntest
        (ignore identical programs)
        (put new program into first half of M*2)
        """

        if(test_random==False):
            self.test_data_list = test_M
        else:
            self.test_data_list = [random.randint(0, len(self.benchmark_names) - 1) for i in range (0, 8)]
            self.test_data_list = list(set(self.test_data_list))

        print('selected test program:')
        print(self.test_data_list)

        self.N=len(self.benchmark_names)
        self.M=155 ##
        self.NTest = len(self.test_data_list)
        self.NTrain=self.N-self.NTest

        self.generate_train_data()
        self.generate_test_data()


        if(np.any(np.isnan(self.train_input)) or np.any(np.isnan(self.test_input)) ):
            print('Error: nan')
            exit(1)

        if(np.any(np.isinf(self.train_input)) or np.any(np.isinf(self.test_input)) ):
            print('Error: inf')
            exit(1)

        self.write_file()

    def generate_train_data(self):
        n=self.N
        size_train_data = self.NTrain*self.NTrain-self.NTrain
        self.train_input=np.zeros((size_train_data, self.M*2))
        self.train_label=np.zeros((size_train_data, 3))
        idx=0
        res = [0, 0, 0, 0, 0, 0]
        for i in range(0, n):
            for j in range(0, n):
                if(i!=j and not i in self.test_data_list and not j in self.test_data_list
                    and self.cross_tb[i][j]!=-255):
                    data = self.inputs[i]+self.inputs[j]
                    label = self.rank_similarity(i, j)

                    for ii, v in enumerate(label):
                        if v==1:
                            #cut training data here?
                            #if res[ii]<3000:
                            if 1:
                                res[ii]+=1
                                self.train_input[idx]= data
                                self.train_label[idx] = label
                                idx+=1
                            break

        self.train_input=self.train_input[:idx][:]
        self.train_label=self.train_label[:idx][:]
        print('Training data distribution', res)



    def generate_test_data(self):
        n=self.N
        size_test_data = self.NTest*self.N-self.NTest

        self.test_input=np.zeros((size_test_data, self.M*2))
        self.test_label=np.zeros((size_test_data, 3))
        idx = 0
        res = [0, 0, 0, 0, 0, 0]
        for i in self.test_data_list:
            for j in range(0, n):
                if(i!=j and self.cross_tb[i][j]!=-255):
                    self.test_input[idx] = self.inputs[i]+self.inputs[j]
                    tmp = self.rank_similarity(i, j)
                    self.test_label[idx] = tmp

                    for ii, v in enumerate(tmp):
                        if v==1:
                            res[ii]+=1
                            break

                    idx+=1
        self.test_input=self.test_input[:idx][:]
        self.test_label=self.test_label[:idx][:]
        print('Test data distribution', res)



    def rank_similarity(self, i, j):
        # similar_of_i=self.similar_programs[i]
        # res = None
        # for (program_id, improvement) in similar_of_i:
        #     #if 2nd program appears in 1st program's similar_programs list
        #     #i.e. OPT(2) is better than O3(1)
        #     if(program_id==j):
        #         #if OPT(2) is better than O3(1) by more than 10%
        #         if((float)(improvement)>10):
        #             res = (1, 0, 0)
        #         #if OPT(2) is better than O3(1) by less than 10%
        #         else:
        #             res = (0, 1, 0)
        #
        #
        # #if OPT(2) is worse than O3(1)
        # if res == None:
        #     res = (0, 0, 1)
        #
        #     if self.cross_tb[i][j]>0:
        #         print('i',self.benchmark_names[i])
        #         print('j',self.benchmark_names[j])
        #         print('similar of i',similar_of_i,'j',j,'not found')
        #         print('tb',self.cross_tb[i][j])
        #         input()
        #
        #
        # if res == (0,0,1) and self.cross_tb[i][j]>0:
        #     print('!',self.cross_tb[i][j], res)

        v = self.cross_tb[i][j]

        '''
        Three class:
            +2.5% better than O3
            +2.5% - -2.5% not sure
            -2.5% worse than O3
        '''
        if v>2.5:
            return 1,0,0
        if v<=2.5 and v>-2.5:
            return 0,1,0
        if v<=-2.5:
            return 0,0,1

        else:
            print('Error in rank_similarity')
            exit(1)
