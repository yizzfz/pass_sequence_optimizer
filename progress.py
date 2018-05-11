import pickle

def load_prepared(base_dir):
    try:
        with open(base_dir+'/PP.pkl', 'rb') as f:
            pp = pickle.load(f)
            f.close()
    except FileNotFoundError as e:
        print("cannot find PP.pkl")
        pp = []
    return pp

def load_finished(base_dir):
    try:
        with open(base_dir+'/FF.pkl', 'rb') as f:
            ff = pickle.load(f)
            f.close()
    except FileNotFoundError as e:
        print("cannot find FF.pkl")
        ff = []
    return ff

def shorten(s):
    if 'poly' in s:
        return s[s.find('poly'):]
    elif 'cBench' in s:
        return s[s.find('cBench'):]
    else:
        return s

def main():
    ff=load_finished('./workspace')
    pp=load_prepared('./workspace')
    print ('prepared:')
    print (len(pp))
    for p in pp:
        print(shorten(p))
    print('\n')
    print ('finished:')
    print (len(ff))
    for f in ff:
        print(shorten(f))



if __name__ == "__main__":
    main()
