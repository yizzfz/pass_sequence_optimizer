rm -rf CMakeCache.txt
rm -rf CMakeFiles
cmake . -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_CXX_FLAGS=-Wno-unknown-warning-option -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_DEFAULT_CMP0057=NEW
