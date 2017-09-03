root=/home/naim/compiler


cd $root/collectInfo
ninja

VAR=$?
cd $root/workspace
cd src
dir=$root/workspace


declare -a arr=("tmp" )


if [ $VAR -eq 0 ]; then 
	echo "start" > $dir/info.txt
	for i in "${arr[@]}" 
	do
		echo "in" $i
		echo "--------------------" $i "--------------------" >> $dir/info.txt
		cd $i
		rm IRinfo.txt
		make CFLAGS='' CXXFLAGS='-Xclang -load -Xclang /home/naim/compiler/collectInfo/info.so'
		cd ..
		echo "----------------------------------------------" >> $dir/info.txt
		echo $'\n' >> $dir/info.txt
		
		
	done
fi

