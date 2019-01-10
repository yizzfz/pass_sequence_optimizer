lines_new = []
# with open('pass_manager_options.txt') as f:
#     lines = f.read().split('\n')
#     for line in lines:
#
#         if '//' in line:
#             line = line[:line.find('//')]
#         if line == '':
#             continue
#         lines_new.append(line)
#
# with open('pass_manager_options_new.txt', 'w') as f:
#     f.write('\n'.join(lines_new))

# with open('MPM.txt') as f:
#     lines = f.read().split('\n')
#     for line in lines:
#         if 'MPM.add(' not in line:
#             continue
#         if ':' in line:
#             line = line[line.find(':')+1:]
#         if ';' in line:
#             line = line[:line.find(';')+1]
#         else:
#             continue
#         if '//' in line:
#             line = line[:line.find('//')]
#         if line == '':
#             continue
#         lines_new.append(line)
#
# lines_new = list(set(lines_new))
# with open('MPM_new', 'w') as f:
#     f.write('\n'.join(lines_new))

lines = []
lines += (open('pass_manager_options.txt').read().split('\n'))
lines += (open('MPM.txt').read().split('\n'))
lines += (open('FPM.txt').read().split('\n'))
lines_new = list(set(lines))
lines_new.sort()
open('pass_manager_options_new.txt', 'w').write('\n'.join(lines_new))
