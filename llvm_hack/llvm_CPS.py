import os
import subprocess
import random


class CPS_Generator:
    def __init__(self):
        self.path = os.path.dirname(os.path.abspath(__file__))
        self.O3_list = self.get_list_from_file(self.path+'/PM_O3.txt')
        self.all_list = self.get_list_from_file(self.path+'/PM_all.txt')
        self.llvm_src_dir = subprocess.getoutput('llvm-config --src-root')
        self.llvm_build_dir = self.llvm_src_dir+'/../llvm-4.0.1.build'
        cmd_text = 'Enter llvm build dir (default ' + self.llvm_build_dir + '): '
        cmd = input(cmd_text)
        if cmd != '':
            self.llvm_build_dir = cmd
        with open(self.path+'/opt.empty.cpp') as f:
            text = f.read()
            self.text_before = text[:text.find('/* place holder */')]
            self.text_after = text[text.find('/* place holder */'):]

    def get_list_from_file(self, filename):
        with open(filename) as f:
            lines = f.read().split('\n')
        return lines

    def set_default_list(self, O3=False):
        if O3:
            file_to_use = self.path + '/opt.O3.cpp'
        else:
            file_to_use = self.path + '/opt.empty.cpp'
        self.replace_opt_cpp(file_to_use)

    def replace_opt_cpp(self, file_to_use):
        subprocess.call(['cp', file_to_use, self.llvm_src_dir+'/tools/opt/opt.cpp'])
        # subprocess.call(['cp', self.path+'PassManagerBuilder.cpp',
        #                  self.llvm_src_dir+'/lib/Transforms/IPO/PassManagerBuilder.cpp'])
        # subprocess.call(['cp', self.path+'PassManagerBuilder.h',
        #                  self.llvm_src_dir+'/include/llvm/Transforms/IPO/PassManagerBuilder.h'])
        subprocess.check_call(['sudo make install -j'], cwd=self.llvm_build_dir,
                              shell=True, stdout=subprocess.DEVNULL,
                              stderr=subprocess.DEVNULL)

    def update_opt_cpp(self, list):
        filename = self.path + 'opt.generated.cpp'
        with open(filename, 'w') as f:
            f.write(self.text_before)
            f.write('\n'.join(list))
            f.write(self.text_after)
        self.replace_opt_cpp(filename)

    # generate a random list of idx within [0, n]
    def random_gen(self, n):
        new_list = []
        for i in range(0, random.randint(0, n - 1)):
            index = random.randint(0, n - 1)
            new_list.append(index)
        return new_list

    def generate_list(self, parent_list=[]):
        if parent_list == []:
            parent_list = self.O3_list
        new_list = parent_list[:]
        change_rate = min(20, len(parent_list) - 1)

        random_insert_idx = self.random_gen(change_rate)
        random_delete_idx = self.random_gen(change_rate)

        for k in random_delete_idx:
            new_list[k] = 'd'

        for k in random_insert_idx:
            pos = random.randint(0, len(parent_list) - 1)
            new_list.insert(pos, self.all_list[k])

        final_list = [e for e in new_list if e != 'd']
        # print ('new list = ', final_list)
        # print ('current size ', len(parent_list), ' insert ', len(random_insert_idx), ' delete ', len(random_delete_idx), ' new size ', len(final_list))
        self.update_opt_cpp(final_list)
        return final_list

if __name__ == '__main__':
    g = CPS_Generator()
    g.set_default_list(O3=True)
