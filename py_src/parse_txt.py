import os
import sys
import pickle

data_types = ['half', 'float', 'double', 'i1', 'i8', 'i16', 'i32', 'i64', 'i1*', 'i8*', 'i16*', 'i32*', 'i64*', 'vector', 'other']
performance_metrics = [
  'loop ID', 'loop at depth', 'basic blocks', 'inst', 'coverage wrt function',
  'load', 'store', 'load/store ratio', 'memory allocation', 'GEP instructions',
  'all memory instructions', 'all memory instructions', 'binary instructions',
  'binary instructions (%)', 'integer', 'floating point', 'int/fp ratio',
  'most common data type', 'contain vector instructions', 'vector instructions',
  'trip count', 'exlusive basic blocks',
  'exlusive inst', 'exlusive ratio', 'critical edges', 'unconditonal branch',
  'conditional branch', 'undirect branch', 'PHI node', 'function call',
  'basic block with <50 insts', 'basic block with 50-100 insts',
  'basic block with >100 insts']

pass_dict = {}
datatype_dict = {}


def main():
  global pass_dict
  global datatype_dict


  data_dir = '../data1'
  (pass_list, pass_dict) = get_all_passlist()
  for i, p in enumerate(data_types):
    datatype_dict[p] = i

  (bench_list, bench_path, bench_dict) = get_benchmarks(data_dir)
  rng = len(bench_list)

  O0data = []
  O3data = []
  opt = []
  similar = []

  all_data = []

  print rng
  for i in range (0, rng-1):

    O0data.append(read_O0(bench_path[i]))
    O3data.append(read_O3(bench_path[i]))
    opt.append(read_opt(bench_path[i]))
    similar.append(get_similar(bench_path[i], bench_dict))
    tup = (bench_list[i], bench_path[i], O0data[i], O3data[i], opt[i], similar[i])
    all_data.append(tup)


  with open('data.pkl', 'wb') as f:
    pickle.dump(all_data, f)
    pickle.dump(data_types, f)
    pickle.dump(pass_list, f)
    pickle.dump(performance_metrics, f)


def get_similar(path, bench_dict):
  try:
    res = []
    with open(path+'/workedForMe.txt', 'rb') as f:
      lines = f.read().split('\n')
      for line in lines:
        if line == '':
            continue
        tmp = line.split('\t')
        improve = tmp[1]
        name = tmp[0]
        b = ''
        t = name.split('/')
        a = 0
        if 'cBench' in line:
          b = 'cBench'
          for i, tt in enumerate(t):
            if a==1 and not 'src_work' in tt:
              b += '-'+tt
            if 'cBench' in tt:
              a = 1

        elif 'poly' in line:
          b = 'poly'
          for i, tt in enumerate(t):
            if a==1:
              b += '-'+tt
            if 'poly' in tt:
              a = 1

        if b!='':
          res.append((bench_dict[b], improve))

    return res

  except IOError:
    print 'workedForMe.txt does not exist'
    return

def read_O3(path):
  (time, size) = get_performance(path+'/data_O3_0/performance.txt')
  passlist = get_passlist(path+'/data_O3_0/passList.txt')
  IRinfo = get_IRinfo(path+'/data_O3_0/IRinfo.txt')
  return time, size, passlist, IRinfo

def read_O0(path):
  IRinfo = get_IRinfo(path+'/data_O0/IRinfo.txt')
  IRinfo_p = get_profile(path+'/data_O0/IRinfo_profile.txt')
  return IRinfo, IRinfo_p

def read_opt(path):
  optimal = ''
  lmax = 0
  for root, dirs, files in os.walk(path):
    for dir in dirs:
      if 'data_A' in dir:
        idx = dir[6:]
        if idx > lmax:
          lmax = idx
          optimal = dir

  if optimal == '':
    return

  data_path = path + '/'+optimal
  (time, size) = get_performance(data_path+'/performance.txt')
  passlist = get_passlist(data_path+'/passList.txt')
  IRinfo = get_IRinfo(data_path+'/IRinfo.txt')
  return time, size, passlist, IRinfo


def get_benchmarks(data_dir):
  bench = []
  bench_path = []
  for root, dirs, files in os.walk(data_dir):
    for file in files:
      if 'MARKER' in file:
        if 'cBench' in root:
          t = root.split('/')
          bench.append('cBench-'+t[3])
          bench_path.append(root)
        elif 'poly' in root:
          t = root.split('/')
          s = 'poly-'+t[3]
          if len(t)>4:
            s+='-'+t[4]
          if len(t)>5:
            s+='-'+t[5]
          bench.append(s)
          bench_path.append(root)

  bench_dict = {}
  for i, p in enumerate(bench):
    bench_dict[p] = i
  return bench, bench_path, bench_dict



def get_all_passlist():
  pass_dict = {}
  with open('../workspace/allPassList.txt', 'rb') as f:
    lines = f.read().split('\n')

  for i, p in enumerate(lines):
    pass_dict[p] = i

  return lines, pass_dict


def get_profile(file):
  loops_info = []
  tmp = None
  try:
    with open(file, 'rb') as f:
      for line in f:
        if 'loop ID' in line:

          if tmp != None:
              loops_info.append(tmp)
          tmp = {}
          # split based on ' = '
          num = line.split(' = ')[1]

          # remove \n
          num = num[0:len(num)-1]
          tmp['loop ID'] = num

        elif line=='\n':
          continue
        else:
          metric = line.split(' = ')[0]
          num = line.split(' = ')[1]
          num = num.split(' ')[0]
          tmp[metric] = int(num)

  except IOError, IndexError:
    print 'Error in ' + file

  return loops_info

def get_IRinfo(file):

  loops_info = []
  tmp = None
  try:
    with open(file, 'rb') as f:
      for line in f:
        if 'loop ID' in line:
          if tmp != None:
              loops_info.append(tmp)
          tmp = {}
          # split based on ' = '
          num = line.split(' = ')[1]
          # remove \n
          num = num[0:len(num)-1]
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
  except IOError, IndexError:
    print 'Error in ' + file

  return loops_info

def get_performance(file):
  try:
    with open(file, "rb") as f:
      lines = f.read().split('\n')
      time = lines[0].split(": ")[1]
      size = lines[1].split(": ")[1]
      return (time, size)
  except IOError:
    print "Error: File does not appear to exist :" + file
    return (-1, -1)


def get_passlist(file):
  global pass_dict
  firstline = []
  try:
    with open(file, "rb") as f:
      firstline = f.read().split('\n')[0]
    args = firstline.split(' ')
    args1 = [pass_dict[x] for x in args if x.startswith('-') and pass_dict.has_key(x)]
    return args1
  except IOError:
    print "Error: File does not appear to exist :" + file

if __name__ == "__main__":
  main()
