import os
import subprocess
import shutil


def main():
  dir_cnt = 0
  file_cnt = 0
  for root, dirs, files in os.walk("."):
    for dir in dirs:
      if dir.startswith('data_') or dir.startswith('work_'):
        shutil.rmtree(os.path.join(root, dir))
        dir_cnt+=1
        
    for file in files:
      if ('IRinfo' in file or file.endswith('ll') or 'hotpath' in file or 
          file.endswith('.out') or 'prof' in file or 'MARKER' in file):
        os.system('rm '+(os.path.join(root, file)))
        file_cnt+=1
  
  print str(dir_cnt) + ' directories and '+ str(file_cnt) + ' files deleted'

if __name__=="__main__":
  main()
