import os
import sys

data_types = ['half', 'float', 'double', 'i1', 'i8', 'i16', 'i32', 'i64', 'i1*', 'i8*', 'i16*', 'i32*', 'i64*', 'vector', 'other']


class_names = ['gemm', 'gemver', 'gesummv', 'symm', 'syr2k', 'syrk', 'trmm',
               '2mm', '3mm', 'atax', 'bicg', 'doitgen', 'mvt', 'cholesky',
               'durbin', 'gramschmidt', 'lu', 'ludcmp', 'trisolv', 'deriche',
               'floyd-warshall', 'nussinov', 'adi', 'fdtd-2d', 'heat-3d',
               'jacobi-1d', 'jacobi-2d', 'seidel-2d']


def main():
    parent_dir = '../../poly-e2/'
    #get_IRinfo('../../poly-e2/stencils/seidel-2d/data_O3_1/IRinfo.txt')
    #sys.exit()
    #parent_dir = '../../poly-e2/stencils/jacobi-1d/data_A12'
    parent_dir = '../../poly-e2'
    pass_dict = get_all_passlist()

    for root, dirs, files in os.walk(parent_dir):
        for fd in files:
            for item in class_names:
                if (item in root) and (fd.endswith('.txt')) and not ('err' in root):
                    if fd=="performance.txt":
                        (time, size) = get_performance(root+'/'+fd)
                    if fd=="passList.txt":
                        passlist = get_passlist(root+'/'+fd, pass_dict)
                    if fd=="IRinfo.txt":
                       res = get_IRinfo(root+'/'+fd)

def get_all_passlist():
    pass_dict = {}
    with open('../allPassList.txt', 'rb') as f:
      lines = f.read().split('\n')

    for i, p in enumerate(lines):
      pass_dict[p] = i

    return pass_dict


def get_IRinfo(file):
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
    
    datatype_dict = {}
    for i, p in enumerate(data_types):
      datatype_dict[p] = i
      
    with open(file, 'rb') as f:
        try:
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
                elif line=='\n':
                    continue
                else:
                    metric = line.split(' = ')[0]
                    num = line.split(' = ')[1]
                    if metric in performance_metrics:
                        num = num[0:len(num)-1]
                        if '%' in num:
                            num = float(num[0:len(num)-1]) / float(100)
                        elif metric == 'most common data type':
                            if '<' in num and '>' in num:
                                num = datatype_dict['vector']
                            elif datatype_dict.has_key(num):
                                num = datatype_dict[num]
                            else:
                                num = datatype_dict['other']
                        elif num == 'INF':
                            num = float('Inf')
                        tmp[metric] = float(num)
        except IndexError:
            print 'error in ' + file
            
    #print(loops_info[0])

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
