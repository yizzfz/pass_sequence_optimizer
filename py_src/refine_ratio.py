
import pickle
import sys
import itertools
import pdb
import numpy as np

test_data_list=[2, 9, 11, 25, 22, 30, 37, 45, 52, 33]

class Refine(object):
    def __init__(self):
        self.read_file()
        self.modify()
        self.write_file()

    def read_file(self, name='data.pkl'):
        with open(name, 'rb') as f:
            self.raw_data = pickle.load(f)
            self.list_data_type = pickle.load(f)
            self.list_pass = pickle.load(f)
            self.list_metric = pickle.load(f)
            f.close()

    def write_file(self, name='data.pkl'):
        with open(name, 'wb') as f:
            pickle.dump(self.raw_data, f)
            pickle.dump(self.list_data_type, f)
            pickle.dump(self.list_pass, f)
            pickle.dump(self.list_metric, f)
            f.close()

    def refine(self, irinfo):
        for ir in irinfo:
            load = ir['load']
            store = ir['store']
            ratio = (load+1)/(store+1)
            # print(load)
            # print(store)
            # print(ir['load/store ratio'])
            ir['load/store ratio'] = ratio
            # print(ir['load/store ratio'])
            # print()

        return irinfo


    def modify(self):
        self.new_data = []

        for i, item in enumerate(self.raw_data):

            irinfo_O0 = item[2][0]
            irinfo_O3 = item[3][3]

            irinfo_O0 = self.refine(irinfo_O0)
            irinfo_O3 = self.refine(irinfo_O3)

            if(item[4]!=None):
                irinfo_GA = item[4][3]
                irinfo_GA = self.refine(irinfo_GA)




def main():
    r = Refine()


if __name__ == "__main__":
    main()
