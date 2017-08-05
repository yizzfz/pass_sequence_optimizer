import os


class_names = ['gemm', 'gemver', 'gesummv', 'symm', 'syr2k', 'syrk', 'trmm',
               '2mm', '3mm', 'atax', 'bicg', 'doitgen', 'mvt', 'cholesky',
               'durbin', 'gramschmidt', 'lu', 'ludcmp', 'trisolv', 'deriche',
               'floyd-warshall', 'nussinov', 'adi', 'fdtd-2d', 'heat-3d',
               'jacobi-1d', 'jacobi-2d', 'seidel-2d']
def main():
    parent_dir = '../../poly-e2/'
    for root, dirs, files in os.walk(parent_dir):
        for fd in files:
            for item in class_names:
                if (item in root) and (fd.endswith('.txt')):
                    print(root, fd)

# def parse_under_dir():
def get_performance():
    print "hi"    
    
    
def get_passlist():
    pass
    pass
    pass
    pass
    pass
def get_IRInfo():
    pass


if __name__ == "__main__":
    main()
