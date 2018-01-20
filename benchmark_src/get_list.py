import os


def main():
  passlist = []
  with open('allPassList.txt', 'rb') as f:
    lines = f.read().split('\n')
    print lines  
