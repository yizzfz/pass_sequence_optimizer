: "${IR_PASS?Need to set IR_PASS}"
: "${WORKSPACE?Need to set WORKSPACE}"

rm -r workspace
mkdir workspace
cp -r benchmark_src/* workspace/
cd LoopInfo
./compilePass.sh && make
cd ../workspace

cd polybench-c-4.2.1-beta
./compile_uti.sh
cd ..

python3 check_all.py
