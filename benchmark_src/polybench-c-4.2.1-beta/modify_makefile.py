import os

def main():

    i = 0
    for root, dirs, files in os.walk("."):
        for file in files:
            if file=="makefile":
                with open(root+"/makefile", 'r+') as f:
                    data = f.read()

                    a1 = data.find("./a.out")
                    a2 = data.find("FLAGS=")

                    data = data[:a1] + "./a.out 2>data.dmp" + data[a1+7:]
                    data = data[:a2] + "FLAGS=-I$(ULT) -DPOLYBENCH_DUMP_ARRAYS" + data[a2+14:]

                    f.seek(0)
                    f.write(data)




if __name__=="__main__":
  main()
