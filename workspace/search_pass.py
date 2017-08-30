import random
import os
import time
import subprocess
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue

def load_from_txt(file):
    with open(file,"rb") as f:
        lines = f.read().split('\n')
    passes = lines[:len(lines)-1]
    return passes

def random_gen(n):
    new_list = []
    for i in range(0, random.randint(0, n-1)):
        index = random.randint(0 , n-1)
        new_list.append(index)
    return new_list

def random_select(plist, n):
    new_list = []
    rng = min(len(plist)-1, n-1)
    for i in range(0, n):
        index = random.randint(0 , rng-1)
        new_list.append(plist[index])
    return list(set(new_list))

def list_to_string(pass_list):
    s = ''
    for ele in pass_list:
      s += ' ' + ele
    return s
   
   
def generate_list(all_list, parent_list):
    new_list = parent_list[:]
    change_rate = min(20, len(parent_list)-1)       
    
    #insert/delete rate
    #delete_rate = int(len(parent_list)*0.2)
    #insert_rate = 3000/len(parent_list)
    delete_rate = change_rate
    insert_rate = change_rate
    
    
    random_insert_idx = random_gen(insert_rate)
    random_delete_idx = random_gen(delete_rate)

    for k in random_delete_idx:
      new_list[k] = 'd'
      
    for k in random_insert_idx:
      pos = random.randint(0 , len(parent_list)-1)
      new_list.insert(pos, all_list[k])
      
    final_list = [e for e in new_list if e!='d']
    #print 'new list = ', final_list
    #print 'current size ', len(parent_list), ' insert ', len(random_insert_idx), ' delete ', len(random_delete_idx), ' new size ', len(final_list) 
    return final_list


def record_list(prefix, time, size, cnt):
    subdir = 'data_' + prefix + str(cnt)
    os.environ["SUBDIR"] = subdir
    os.system('mkdir -p $SUBDIR')
    os.system('touch tmp_empty.ll')
    os.system('opt tmp_empty.ll -S $OPTFLAGS -debug-pass=Structure -o tmp_empty1.ll 2> $SUBDIR/passList.txt')
    os.system('rm tmp*.ll')
    os.system('cp IRinfo.txt $SUBDIR/IRinfo.txt')
    #os.system('cp *.ll $SUBDIR/')
    with open(subdir+'/performance.txt', "wb") as f:
      f.write('execution time: ' + str(time) + '\n')
      f.write('binary size: ' + str(size) + '\n')
   
def ga(all_list, parent_list, current_dir, time_baseline, size_baseline):
    best_time = time_baseline
    best_list = parent_list[:]
    size = size_baseline
    improved = 0
    cnt = 0
    #num of children per run
    for i in range (1,6):
      cnt+=1
      os.system('rm IRinfo*')
      child_list = generate_list(all_list, parent_list)
      res = create_child(child_list, current_dir)
      if res[0] == 0:
        child_time = res[1]
        child_size = res[2]
        time_improve = (time_baseline - child_time)*100/time_baseline
        size_improve = (size_baseline - child_size)*100/size_baseline
        print 'child ', i, ': num of passes ', len(child_list), ', time {:.3f} '.format(child_time), '({:.3f}%)'.format(time_improve), ', bin size ', child_size , '(', size_improve, '%)'
        if time_improve > 0.5:      #choose this child if improvment is greater than ?%
          if child_time < best_time:
            best_time = child_time
            best_list = child_list[:]
            size = child_size
            improved = 1
            record_list('A', child_time, child_size, cnt)
        else:
          record_list('B', child_time, child_size, cnt)
    
    return (improved, best_time, best_list, size)
        
      
      
def create_child(child_list, current_dir):
    list_str = list_to_string(child_list)
    os.environ["OPTFLAGS"] = list_str
    #print '\n', list_str, '\n'
    
    DEVNULL = open(os.devnull, 'wb', 0)
    try:
      check_call(['make'], cwd = current_dir, shell = True)
    except subprocess.CalledProcessError as e:
      with open(current_dir+"/error.txt","ab") as f:
        f.write(list_to_string(child_list))
        f.write('\n')
      record_list('err_', -1, -1, 0)
      return (1,-1,-1)
    
    etime = -1.0
    size = -1
    start = time.time()
    check_call(['make run'], stdout=DEVNULL, stderr=STDOUT, cwd = current_dir, shell = True)
    end = time.time()
    etime = end - start
    size = int(check_output('ls -nl a.out | awk \'{print $5}\'', cwd = current_dir, shell = True))
    return (0, etime, size)
    
    
def get_testcodes(base_dir):
    testcodes = []
    for root, dirs, files in os.walk(base_dir):
      cfiles = []
      for file in files:
        if file == 'MARKER':
          testcodes.append(os.path.realpath(root))
    return testcodes
  
def read_O3_time(current_dir):
    time = 0
    try:
      os.chdir(current_dir+'/data_O3_1')
    except OSError as e:
      print current_dir + ' does not have /data_O3_1'
      return -1
      
    with open("performance.txt","rb") as f:
        lines = f.read().split('\n')
    s = lines[0].split(': ')
    time = float(s[1])
    return time

def compare_with_other(current_dir, testcodes, current_list):
    with open(current_dir+"/workedFor.txt","ab") as f:
      for testcode in testcodes:
        os.chdir(testcode)
        O3time = read_O3_time(current_dir)
        res = create_child(current_list, testcode)
        if res[0] == 0:
          if res[1] < O3time:
            f.write(testcode)
            f.write('\n')



def t_prepare(current_dir, O3_list):
    os.chdir(current_dir)
    O3_list_str = list_to_string(O3_list)
    
    os.system("rm -rf data* *.txt")
    os.system('mkdir data_O0')
    os.system('make hotpath')
    os.system('cp IRinfo.txt data_O0/IRinfo.txt')
    os.system('cp IRinfo_profile.txt data_O0/IRinfo_profile.txt')
      
    os.environ["OPTFLAGS"] = O3_list_str
    err = os.system('make')
    O3time = -1.0
    O3size = -1
    if err==0:
      DEVNULL = open(os.devnull, 'wb', 0)
      start = time.time()
      check_call(['make run'], stdout=DEVNULL, stderr=STDOUT, cwd = current_dir, shell = True)
      end = time.time()
      O3time = end - start
      O3size = int(check_output('ls -nl a.out | awk \'{print $5}\'', cwd = current_dir, shell = True))
    else:
      print 'cannot compile with O3: ' + current_dir
      return
    
    print '['+ current_dir + '] O3 time = ', O3time, ', bin size = ', O3size
    record_list('O3_', O3time, O3size, 1)
      
  
def t_GA(current_dir, all_list, O3_list, testcodes):  
      cnt=0
      os.chdir(current_dir)
      current_list = O3_list[:]
      current_time = read_O3_time(current_dir)
      if current_time == -1:
        return
      
      os.chdir(current_dir)
      current_size = 1
      fail_in_a_row = 0
      
      #### num. ga steps ####
      for i in range(1,100):                        
        res = ga(all_list, current_list, current_dir, current_time, current_size)
        improved = res[0]
        if improved == 0:
          print 'did not improve'
          fail_in_a_row += 1
          if fail_in_a_row > 10:
            print 'stop at step ', i
            break
        else:
          fail_in_a_row = 0
          current_time = res[1]
          current_list = res[2][:]
          current_size = res[3]
      print '['+current_dir+'] final time = ', current_time, ', bin size = ', current_size
      compare_with_other(current_dir, testcodes, current_list)


    
def main():
    global cnt
    all_list = load_from_txt('allPassList.txt')
    O3_list = load_from_txt('O3List.txt')
    
    
    
    
    base_dir = '.'
    #base_dir = './polybench-c-4.2.1-beta/linear-algebra/blas/gemm'
    #base_dir = './cBench_V1.1/automotive_bitcount'
    
    testcodes = get_testcodes(base_dir)
    
    if len(testcodes) == 0:
      print 'cannot find any MARKER, run \'generate_makefile\''
      
      
    #testcodes = random_select(testcodes, 4)
    
    print 'found ' + str(len(testcodes)) + ' benchmarks:'
    print testcodes
    cmd = raw_input('continue? (y/n) ')
    if cmd == 'y':
      threads = []
      i=0
      for testcode in testcodes:
        thread = Process(target = t_prepare, args = (testcode, O3_list))
        threads.append(thread)
        threads[i].start()
        i+=1

      for thread in threads:
        thread.join()
      
      threads = []
      i=0
      for testcode in testcodes:
        thread = Process(target = t_prepare, args = (testcode, O3_list))
        threads.append(thread)
        threads[i].start()
        i+=1
      
      for thread in threads:
        thread.join()    
      
    

if __name__=="__main__":
    main()
    
    
#['/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/solvers/trisolv', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/solvers/ludcmp', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/solvers/lu', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/solvers/durbin', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/solvers/cholesky', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/solvers/gramschmidt', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/blas/trmm', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/blas/symm', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/blas/syr2k', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/blas/gemver', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/blas/gesummv', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/blas/gemm', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/blas/syrk', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/kernels/mvt', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/kernels/doitgen', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/kernels/3mm', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/kernels/atax', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/kernels/bicg', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/linear-algebra/kernels/2mm', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/medley/floyd-warshall', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/medley/deriche', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/stencils/jacobi-1d', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/stencils/heat-3d', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/stencils/fdtd-2d', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/stencils/adi', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/stencils/jacobi-2d', '/local/scratch/hc475/summer/workspace/polybench-c-4.2.1-beta/stencils/seidel-2d']

