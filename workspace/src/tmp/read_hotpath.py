
import sys

def main():
  filename = str(sys.argv[1])
  with open(filename, "rb") as f:
    lines = f.read().split('\n')
    f_names = []
    f_contents = []
    tmp = []
    for line in lines:
      if line!='':
        if (not line.startswith(' ')):
          fname = line[:-1]
          f_names.append(fname)
          if len(tmp)>0:
            f_contents.append(tmp)
          tmp = []
        else:
          tmp.append(line)   
          
    if len(tmp)>0:
      f_contents.append(tmp)         
            
  print len(f_names)
  print len(f_contents)
  for cnt in range(0,len(f_names)):
    print f_names[cnt]
    print f_contents[cnt]
    
  

if __name__=="__main__":
  main()
