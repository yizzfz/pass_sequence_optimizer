import random
import pickle
import sys
import itertools
import pdb
import numpy as np

test_M=[2, 9, 11, 25, 22, 30, 37, 45, 52, 33]
test_random=True

class Data_wash(object):
    def __init__(self):
        self.read_file()
        self.parse()

    def read_file(self, name='data.pkl'):
        with open(name, 'rb') as f:
            self.raw_data = pickle.load(f)
            self.list_data_type = pickle.load(f)
            self.list_pass = pickle.load(f)
            self.list_metric = pickle.load(f)

    def write_file(self):
        with open('Data/train_input.pkl', 'wb') as f1:
            pickle.dump(self.train_input, f1)

        with open('Data/train_label.pkl', 'wb') as f2:
            pickle.dump(self.train_label, f2)

        with open('Data/test_input.pkl', 'wb') as f3:
            pickle.dump(self.test_input, f3)

        with open('Data/test_label.pkl', 'wb') as f4:
            pickle.dump(self.test_label, f4)

    def parse(self):
        self.benchmark_names = []
        self.paths = []
        # this includes time, size of bin
        self.GA_sequence = []
        self.similar_programs = []
        self.inputs = []
        # flatten array lambda func
        flatten = lambda l: [item for sublist in l for item in sublist]
        for i, item in enumerate(self.raw_data):
            self.benchmark_names.append(item[0])
            self.paths.append(item[1])

            data = self.parse_ir_info_O0(item[2])
            data_O3 = self.parse_ir_info_O3(item[3])
            data.append(data_O3)

            self.inputs.append(flatten(data))

            if(len(flatten(data))!=155):
                print('find unexpected feature length ('+str(len(flatten(data)))+') in ' + item[1])
                #pdb.set_trace()

            if(item[4]!=None):
                self.GA_sequence.append(item[4][2])
            else:
                self.GA_sequence.append([])
            self.similar_programs.append(item[5])

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
            self.test_data_list = [random.randint(0, len(self.raw_data) - 1) for i in range (0, 5)]

        print('selected test program:')
        print(self.test_data_list)

        self.N=len(self.raw_data)
        self.M=155 ##
        self.NTest = len(self.test_data_list)
        self.NTrain=self.N-self.NTest

        self.generate_train_data()
        self.generate_test_data()

        if(np.any(np.isnan(self.train_input)) or np.any(np.isnan(self.test_input)) ):
            print('nan')

        if(np.any(np.isinf(self.train_input)) or np.any(np.isinf(self.test_input)) ):
            print('inf')

        self.write_file()



    def generate_train_data(self):
        n=self.N
        size_train_data = self.NTrain*self.NTrain-self.NTrain
        self.train_input=np.zeros((size_train_data, self.M*2))
        self.train_label=np.zeros((size_train_data, 3))
        idx=0
        for i in range(0, n):
            for j in range(0, n):
                if(i!=j and not i in self.test_data_list and not j in self.test_data_list):
                    self.train_input[idx]=self.inputs[i]+self.inputs[j]
                    self.train_label[idx]=self.rank_similarity(i, j)
                    idx=idx+1


    def generate_test_data(self):
        n=self.N
        size_test_data = self.NTest*self.N-self.NTest

        self.test_input=np.zeros((size_test_data, self.M*2))
        self.test_label=np.zeros((size_test_data, 3))
        idx = 0
        for i in self.test_data_list:
            for j in range(0, n):
                if(i!=j):
                    self.test_input[idx]=self.inputs[i]+self.inputs[j]
                    self.test_label[idx]=self.rank_similarity(i, j)
                    idx=idx+1



    def rank_similarity(self, i, j):
        similar_of_i=self.similar_programs[i]
        for (program_id, improvement) in similar_of_i:
            #if 2nd program appears in 1st program's similar_programs list
            #i.e. OPT(2) is better than O3(1)
            if(program_id==j):
                #if OPT(2) is better than O3(1) by more than 10%
                if((float)(improvement)>10):
                    return (1, 0, 0)
                #if OPT(2) is better than O3(1) by less than 10%
                else:
                    return (0, 1, 0)
        #if OPT(2) is worse than O3(1)
        return (0, 0, 1)


    def parse_ir_info_O3(self, raw_data):
        """
        parse IR info in O3
        """
        self.O3_avg = {}
        time, size_bin, pass_sequence, ir_info = raw_data
        self.average_ir_info(ir_info, 3)
        return_list = []
        for key, value in self.O3_avg.items():
            if key == 'load/store ratio':
                pass
            else:
                return_list.append(value)



        return return_list

    def parse_ir_info_O0(self, raw_data):
        """
        parse both IR info and Profile Info in O0
        Args:
            raw_data: (IR_info, profile_info)
        Each info is a list of dicts,
        these lists of dicts are parsed separately
        """
        self.O0_avg = {}
        self.O0_weighted_avg = {}
        ir_info, profile_info = raw_data
        # compute avg of O0 IR info
        self.average_ir_info(ir_info, 0)
        # parse ir_info find top k
        names, _ = self.top_k_IR_info(ir_info)
        # parse hot path info, find top k
        profile_names, _ = self.top_k_profile_info(profile_info)
        results = self.collect_all(names, profile_names, ir_info)
        data, metric_names, loop_names = results
        return data

    def collect_all(self, names, p_names, ir_info):
        top5 = []
        #print(p_names)
        metric_names = []
        loop_names = []
        for item in ir_info:
            # collect selected ir_info from hotpath
            name = item['loop ID']
            if name in p_names and not name in loop_names:
                #print(name+'*')
                names, vals = self.sep_contents_list(item)

                top5.append(vals)
                metric_names.append(names)
                loop_names.append(name)
            if name in self.O0_profile_ratio.keys():
                self.compute_weighted_avg(item, self.O0_profile_ratio[name])
            else:
                self.compute_weighted_avg(item, 0)

        data = top5

        data.append(self.O0_avg.values())
        data.append(self.O0_weighted_avg.values())
        metric_names.append(self.O0_avg.keys())
        metric_names.append(self.O0_weighted_avg.keys())
        loop_names.append('avg')
        loop_names.append('weighted_avg')



        return (data, metric_names, loop_names)

    def compute_weighted_avg(self, ir_item, ratio):


        for key, val in ir_item.items():
            if key == 'loop ID' or key == 'int/fp ratio':
                pass

            else:
                if key in self.O0_weighted_avg.keys():
                    if key == 'trip count' and val == -1:
                        self.O0_weighted_avg[key] += 0
                    else:
                        self.O0_weighted_avg[key] += val * ratio
                else:
                    self.O0_weighted_avg[key] = 0




    def sep_contents_list(self, ir_item):
        names = []
        vals = []
        for key, val in ir_item.items():
            if key == 'loop ID' or key == 'int/fp ratio':
                pass
            else:
                names.append(key)
                vals.append(val)

        return (names, vals)

    def top_k_profile_info(self, info, k=3):
        names = []
        local_inst = []
        total_inst = []
        loop_exe_cnt = []
        scores = []
        for i, item in enumerate(info):
            names.append(item['loop ID'])
            local_inst.append(item['number of instructions executed here '
                                   '(excluding subloops)'])
            total_inst.append(item['number of instructions executed here'])
            if item['loop execution count'] >= 0:
                loop_exe_cnt.append(item['loop execution count'])
            else:
                loop_exe_cnt.append(0)
            scores.append(local_inst[i] * loop_exe_cnt[i])
        indexes = sorted(range(len(scores)), key=lambda i: scores[i])[-k:]
        top_k_names = []
        top_k_scores = []
        self.O0_profile_ratio = {}
        for i, score in enumerate(scores):
            self.O0_profile_ratio[names[i]] = score / float(sum(scores))
        for index in indexes:
            top_k_names.append(names[index])
            top_k_scores.append(scores[index])
        return(top_k_names, top_k_scores)

    def average_ir_info(self, info, O_level=0):
        avg = {}
        # init
        for key in info[0].keys():
            if key == 'loop ID' or key == 'int/fp ratio':
                pass
            else:
                avg[key] = 0
        # accumulate each value
        for item in info:
            for key, val in item.items():
                if key == 'loop ID' or key == 'int/fp ratio':
                    pass
                else:
                    avg[key] += val

        # avg
        for key in avg.keys():
            avg[key] = avg[key]/len(info)

        if O_level == 0:
            self.O0_avg = avg
        elif O_level == 3:
            self.O3_avg = avg
        else:
            raise("O_level {} is not supported".format(O_level))

    def top_k_IR_info(self, info, k=3):
        """
        Pick the k most valuable loop IR based on hand crafted socres
        """
        names = []
        scores = []
        # score each profile ir
        for item in info:
            name, score = self.score_IR_info(item)
            names.append(name)
            scores.append(score)
        indexes = sorted(range(len(scores)), key=lambda i: scores[i])[-k:]
        top_k_names = []
        top_k_scores = []
        for index in indexes:
            top_k_names.append(names[index])
            top_k_scores.append(scores[index])
        return(top_k_names, top_k_scores)

    def score_IR_info(self, item):
        # item: suppose to be a dict
        name = item['loop ID']
        trip_cnt = item['trip count']
        if trip_cnt == -1:
            trip_cnt = 0
        # score complexity
        complexity = item['inst']/float(self.O0_avg['inst'] + 1e-10) + \
            item['floating point'] / \
            float(self.O0_avg['floating point'] + 1e-10) + \
            item['memory allocation'] / \
            float(self.O0_avg['memory allocation'] + 1e-10) + \
            item['all memory instructions'] / \
            float(self.O0_avg['all memory instructions'] + 1e-10)
        complexity = complexity * trip_cnt
        return (name, complexity)


def main():
    data_washer = Data_wash()


if __name__ == "__main__":
    main()
