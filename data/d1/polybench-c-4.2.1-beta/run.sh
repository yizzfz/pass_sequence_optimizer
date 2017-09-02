folder=medley/nussinov
name=nussinov
dump="-DPOLYBENCH_DUMP_ARRAYS -o ${name}_ref -O0"
time="-DPOLYBENCH_TIME -o ${name}_time -O3"

clang -I utilities -I $folder utilities/polybench.c $folder/$name.c $dump
./${name}_ref 2>${name}_ref.out
clang -I utilities -I $folder utilities/polybench.c $folder/$name.c $time
./${name}_time

