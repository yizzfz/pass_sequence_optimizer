
import pickle
import sys
import itertools
import pdb
import numpy as np
import matplotlib.pyplot as plt
import math

def read_data(name='data.pkl'):
    with open(name, 'rb') as f:
        raw_data = pickle.load(f)
        f.close()
    return raw_data

def read_nn_output(name='Data/result.pkl'):
    with open(name, 'rb') as f:
        result = pickle.load(f)
    return result

def read_dict(name='Data/dict.pkl'):
    with open(name, 'rb') as f:
        dict = pickle.load(f)
    return dict

def read_test_list(name='Data/test_idx.pkl'):
    with open(name, 'rb') as f:
        test_list = pickle.load(f)
    return test_list


def main():
    data = read_data()
    nn_outputs = read_nn_output()
    # p_dict = read_dict()
    test_list = read_test_list()
    # test_list_name = [p_dict[i] for i in test_list]

    all_scaled_O3 = []
    all_eva_best = []
    all_eva_worst = []
    all_eva_mean = []

    for i, program_id in enumerate(test_list):

        O3time = float(data[program_id][3][0])
        O0time = float(data[program_id][2][2])
        GAtime = O3time
        if(data[program_id][4]!=None):
            GAtime = float(data[program_id][4][0])
        work_list = data[program_id][5]

        nn_output = nn_outputs[i]
        evaluated_result = []

        print('O0: '+str(O0time))
        print('O3: '+str(O3time))
        print('GA: '+str(GAtime))



        for pred in nn_output:
            found = False
            for pid, imp in work_list:
                if pid==pred:
                    found = True

                    imp_time = O3time*(1-float(imp)/100)
                    print('imp: '+str(imp_time))
                    scaled_imp = (O0time-imp_time)/(O0time-GAtime)*100
                    evaluated_result.append(scaled_imp)
                    break
            if not found:
                evaluated_result.append(0)

        scaled_O3 = (O0time-O3time)/(O0time-GAtime)*100

        if((scaled_O3>0 and scaled_O3<100)or 1):
            all_scaled_O3.append(scaled_O3)
            all_eva_best.append(max(evaluated_result))
            all_eva_worst.append(min(evaluated_result))
            all_eva_mean.append(sum(evaluated_result) / float(len(evaluated_result)))

        print(scaled_O3)
        print(evaluated_result)
        print()


    #pdb.set_trace()



    N = len(all_scaled_O3)
    print(N)
    ind = np.arange(1, N+1)
    width = 0.15
    opacity = 0.4

    fig, ax = plt.subplots()

    rects1 = ax.bar(ind, all_scaled_O3, width, label='O3', alpha=opacity)
    rects2 = ax.bar(ind+width, all_eva_best, width, label='Best Prediction', alpha=opacity)
    rects3 = ax.bar(ind+width*2, all_eva_mean, width, label='Average Prediction', alpha=opacity)
    rects4 = ax.bar(ind+width*3, np.ones(N)*100, width, label='GA')

    #p2 = plt.bar(ind, GAtimes, width)


    ax.set_xlabel('Programs ({0} in Total)'.format(N))
    ax.set_ylabel('Scaled Performance , higher is better')
    ax.legend()
    #plt.xticks(ind, names)
    #plt.xticks(np.arange(1, N, 10))
    #plt.yticks(np.arange(0, 81, 10))
    #plt.legend((p1[0], p2[0], p3[0]), ('O3', 'best', 'average'))
    fig.tight_layout()
    plt.show()





if __name__ == "__main__":
    main()
