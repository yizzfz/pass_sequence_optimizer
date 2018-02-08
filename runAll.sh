: "${IR_PASS?Need to set IR_PASS}"
: "${WORKSPACE?Need to set WORKSPACE}"

rm -r workspace
mkdir workspace
cp -r benchmark_src/* workspace/
cd LoopInfo
./compilePass.sh && make
cd ../workspace


cd polybench-c-4.2.1-beta
python generate_makefile.py
cd ../cBench_V1.1/
python generate_makefile.py
cd ..

python3 search_pass_st.py
