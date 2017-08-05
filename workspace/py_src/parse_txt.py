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
    for root, dirs, files in os.walk(parent_dir):
        for fd in files:
            for item in class_names:
                if (item in root) and (fd.endswith('.txt')):
                    print(root, fd)

# def parse_under_dir():
<<<<<<< HEAD
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





=======

def get_passlist():
    pass
def get_IRInfo():
    pass


if __name__ == "__main__":
    main()
