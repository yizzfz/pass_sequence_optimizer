"""
Funtionality:
    wash data in data.pkl
Author:
    Aaron Zhao
"""
import pickle
import sys


class Data_wash(object):
    def __init__(self):
        self.read_file()
        self.parse()

    def read_file(self, name='data.pkl'):
        with open(name, 'rb') as f:
            self.raw_data = pickle.load(f)

    def parse(self):
        self.benchmark_names = []
        self.paths = []
        self.ir_info_O0 = []
        self.ir_info_O3 = []
        self.profile_info = []
        # this includes time, size of bin
        self.O3_performance = []
        self.GA_performance = []
        self.O3_sequence = []
        self.GA_sequence = []
        for i, item in enumerate(self.raw_data):
            self.benchmark_names.append(item[0])
            self.paths.append(item[1])
            self.parse_ir_info_O0(item[2])
            sys.exit()

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
        self.average_O0(ir_info)
        # parse ir_info find top k
        names, _ = self.top_k_IR_info(ir_info)
        # parse hot path info, find top k
        profile_names, _ = self.top_k_profile_info(profile_info)
        data, metric_names, loop_names = self.collect_all(names, profile_names, ir_info)
        print(loop_names)

    def collect_all(self, names, p_names, ir_info):
        top5 = []
        metric_names = []
        loop_names = []
        for item in ir_info:
            # collect selected ir_info from hotpath
            name = item['loop ID']
            if name in p_names:
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

    def top_k_profile_info(self, info, k=5):
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
            loop_exe_cnt.append(item['loop execution count'])
            scores.append(local_inst[i] * loop_exe_cnt[i])
        indexes = sorted(range(len(scores)), key=lambda i: scores[i])[-k:]
        top_k_names = []
        top_k_scores = []
        self.O0_profile_ratio = {}
        for i, score in enumerate(scores):
            self.O0_profile_ratio[names[i]] = score / sum(scores)
        for index in indexes:
            top_k_names.append(names[index])
            top_k_scores.append(scores[index])
        return(top_k_names, top_k_scores)

    def average_O0(self, info):
        self.O0_avg = {}
        # init
        for key in info[0].keys():
            if key == 'loop ID' or key == 'int/fp ratio':
                pass
            else:
                self.O0_avg[key] = 0
        # accumulate each value
        for item in info:
            for key, val in item.items():
                if key == 'loop ID' or key == 'int/fp ratio':
                    pass
                else:
                    self.O0_avg[key] += val
        # avg
        for key in self.O0_avg.keys():
            self.O0_avg[key] = self.O0_avg[key]/len(info)

    def top_k_IR_info(self, info, k=5):
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
    # print(type(data_washer.raw_data))


if __name__ == "__main__":
    main()
