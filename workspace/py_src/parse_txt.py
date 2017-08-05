import os
import sys


class_names = ['gemm', 'gemver', 'gesummv', 'symm', 'syr2k', 'syrk', 'trmm',
               '2mm', '3mm', 'atax', 'bicg', 'doitgen', 'mvt', 'cholesky',
               'durbin', 'gramschmidt', 'lu', 'ludcmp', 'trisolv', 'deriche',
               'floyd-warshall', 'nussinov', 'adi', 'fdtd-2d', 'heat-3d',
               'jacobi-1d', 'jacobi-2d', 'seidel-2d']


def main():
    parent_dir = '../../poly-e2/'
    # get_performance('../../poly-e2/stencils/seidel-2d/data_O3_1', 'IRinfo.txt')
    # sys.exit()
    #parent_dir = '../../poly-e2/stencils/jacobi-1d/data_A12'
    parent_dir = '../../poly-e2'
    pass_dict = get_all_passlist()
    
    for root, dirs, files in os.walk(parent_dir):
        for fd in files:
            for item in class_names:
                if (item in root) and (fd.endswith('.txt')):
                    if fd=="performance.txt":
                        (time, size) = get_performance(root+'/'+fd)
                    if fd=="passList.txt":
                        passlist = get_passlist(root+'/'+fd, pass_dict)

def get_all_passlist():
    pass_dict = {}
    with open('../allPassList.txt', 'rb') as f:
      lines = f.read().split('\n')

    for i, p in enumerate(lines):
      pass_dict[p] = i

    return pass_dict

def get_performance(f_dir, name):
    performance_metrics = [
    'loop ID', 'loop at depth', 'basic blocks', 'inst', 'coverage wrt function',
    'load', 'store', 'load/store ratio', 'memory allocation', 'GEP instructions',
    'all memory instructions', 'all memory instructions', 'binary instructions',
    'binary instructions (%)', 'integer', 'floating point', 'int/fp ratio',
    'most common data type', 'contain vector instructions', 'vector instructions',
    'trip count', 'cross-iteration dependency detected', 'exlusive basic blocks',
    'exlusive inst', 'exlusive ratio', 'critical edges', 'unconditonal branch',
    'conditional branch', 'undirect branch', 'PHI node', 'function call',
    'basic block with <50 insts', 'basic block with 50-100 insts',
    'basic block with >100 insts']
    loops_info = []
    tmp = None
    with open(f_dir+'/'+name, 'rb') as f:
        for line in f:
            if 'loop ID' in line:
                if tmp != None:
                    loops_info.append(tmp)
                tmp = {}
                # split based on ' = '
                num = line.split(' = ')[1]
                # remove \n
                num = num[0:len(num)-2]
                tmp['loop ID'] = num
            else:
                for metric in performance_metrics:
                    if metric in line:
                        num = line.split(' = ')[1]
                        num = num[0:len(num)-1]
                        if '%' in num:
                            num = num[0:len(num)-1] / float(100)
                        elif metric == 'most common data type':
                            TO DO
                        tmp[metric] = float(num)
    print(loops_info[0])

def get_performance(file):
    with open(file, "rb") as f:
      lines = f.read().split('\n')
      time = lines[0].split(": ")[1]
      size = lines[1].split(": ")[1]
      return (time, size)


def get_passlist(file, pass_dict):
    firstline = []
    with open(file, "rb") as f:
      firstline = f.read().split('\n')[0]
    args = firstline.split(' ')
    args1 = [pass_dict[x] for x in args if x.startswith('-') and pass_dict.has_key(x)]
    return args1

if __name__ == "__main__":
    main()
