cd LoopInfo
./compilePass.sh && make
cd ../workspace
cd polybench-c-4.2.1-beta
python generate_makefile.py
cd ../cBench_V1.1/
python generate_makefile.py
cd ..
python search_pass.py
