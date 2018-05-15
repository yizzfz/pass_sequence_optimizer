
import pickle
import sys
import itertools
import pdb
import numpy as np
import matplotlib.pyplot as plt
import math

def read_file(name='data.pkl'):
    with open(name, 'rb') as f:
        raw_data = pickle.load(f)
        f.close()
    return raw_data



def main():
    data = read_file()
    res = []
    for i, item in enumerate(data):
        name = item[0]
        O3time = float(item[3][0])
        O0time = float(item[2][2])
        GAtime = O3time
        if(item[4]!=None):
            GAtime = float(item[4][0])
        imp = (O3time-GAtime)/GAtime

        #print(name+': O3 time {:.2f}, GA time {:.2f}, improve {:.1f}'.format(O3time, GAtime, 100.*imp))

        res.append((imp, name, O3time, GAtime))
        res.sort()
        res.reverse()

    for i in res:
        print(i)


    N = len(res)
    print(N)
    ind = np.arange(1, N+1)
    width = 0.3
    imps = [it[0]*100 for it in res]
    names = [it[1] for it in res]
    #O3times = [math.log(it[2]*1000) for it in res]
    #GAtimes = [math.log(it[3]*1000) for it in res]

    p1 = plt.bar(ind, imps, width)
    #p2 = plt.bar(ind, GAtimes, width)


    plt.xlabel('Programs ({0} in Total)'.format(N))
    plt.ylabel('Improvement vs O3 (%)')
    #plt.xticks(ind, names)
    plt.xticks(np.arange(1, N, 10))
    #plt.yticks(np.arange(0, 81, 10))
    #plt.legend((p1[0], p2[0]), ('O3 Performance', 'Optimal'))

    plt.show()


if __name__ == "__main__":
    main()
