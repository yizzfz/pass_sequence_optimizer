import subprocess

src = subprocess.getoutput('llvm-config --src-root')

subprocess.call(['cp', src+'/tools/opt/opt.cpp', 'opt.cpp'])
subprocess.call(['cp', src+'/lib/Transforms/IPO/PassManagerBuilder.cpp',
                 'PassManagerBuilder.cpp'])
subprocess.call(['cp', src+'/include/llvm/Transforms/IPO/PassManagerBuilder.h',
                 'PassManagerBuilder.h'])
