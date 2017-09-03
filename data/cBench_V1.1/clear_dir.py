import os
import subprocess
import shutil


def main():
  for root, dirs, files in os.walk("."):
    for dir in dirs:
      if dir.startswith('data_'):
        shutil.rmtree(os.path.join(root, dir))
    for file in files:
      if file.endswith('MARKER'):
        #print os.path.join(root, file)
        os.system('rm '+os.path.join(root, file))
  
  

if __name__=="__main__":
  main()
