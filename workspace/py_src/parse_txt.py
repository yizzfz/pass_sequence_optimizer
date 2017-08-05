import os


class_names = ['gemm', 'gemver', 'gesummv', 'symm', 'syr2k', 'syrk', 'trmm',
               '2mm', '3mm', 'atax', 'bicg', 'doitgen', 'mvt', 'cholesky',
               'durbin', 'gramschmidt', 'lu', 'ludcmp', 'trisolv', 'deriche',
               'floyd-warshall', 'nussinov', 'adi', 'fdtd-2d', 'heat-3d',
               'jacobi-1d', 'jacobi-2d', 'seidel-2d']
               

def main():
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

def get_IRInfo():
    pass


if __name__ == "__main__":
    main()
