import subprocess

src = subprocess.getoutput('llvm-config --src-root')

subprocess.call(['cp', 'opt.cpp', src+'/tools/opt/opt.cpp'])
# subprocess.call(['cp', 'PassManagerBuilder.cpp',
#                  src+'/lib/Transforms/IPO/PassManagerBuilder.cpp'])
# subprocess.call(['cp', 'PassManagerBuilder.h',
#                  src+'/include/llvm/Transforms/IPO/PassManagerBuilder.h'])

build_dir = src+'/../llvm-4.0.1.build'
cmd_text = 'Enter llvm build dir (default ' + build_dir + '): '
cmd = input(cmd_text)
if cmd != '':
    build_dir = cmd

subprocess.check_call(['sudo make install -j'], cwd=build_dir, shell=True)
