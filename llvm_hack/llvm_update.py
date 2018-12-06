import subprocess

src = subprocess.getoutput('llvm-config --src-root')

subprocess.call(['cp', 'opt.cpp', src+'/tools/opt/opt.cpp'])
subprocess.call(['cp', 'PassManagerBuilder.cpp',
                 src+'/lib/Transforms/IPO/PassManagerBuilder.cpp'])
subprocess.call(['cp', 'PassManagerBuilder.h',
                 src+'/include/llvm/Transforms/IPO/PassManagerBuilder.h'])
