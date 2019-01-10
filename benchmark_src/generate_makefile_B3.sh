list="CoyoteBench Misc Shootout BenchmarkGame Stanford Dhrystone McGill"

for i in $list; do

  cd $i
  cp ../generate_makefile.py .
  python3 generate_makefile.py
  cd ..
  echo $i " - done"

done
