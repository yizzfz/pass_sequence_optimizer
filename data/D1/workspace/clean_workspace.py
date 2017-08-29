import os
import subprocess
import shutil


def main():
  for root, dirs, files in os.walk("."):
    for dir in dirs:
      if dir.startswith('data_'):
        shutil.rmtree(os.path.join(root, dir))
        
    for file in files:
      if ('IRinfo' in file or file.endswith('ll') or file.endswith('.o') or 'hotpath' in file or 
          file.endswith('.out') or 'prof' in file or file=='MARKER'):
        os.system('rm '+(os.path.join(root, file)))
  
  

if __name__=="__main__":
  main()
