import os
import subprocess
import shutil


def main():
  for root, dirs, files in os.walk("."):
    for dir in dirs:
      if dir.startswith('data_'):
        #print os.path.join(root, dir)
        shutil.rmtree(os.path.join(root, dir))
  
  

if __name__=="__main__":
  main()
