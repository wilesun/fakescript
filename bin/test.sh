#! /bin/sh

JIT_FLAG=" -y "
if [ $# == 1 ] && [ $1 == "-j" ];then
    JIT_FLAG=" -jy "
    echo "use jit"
fi

NUM=63
chmod a+x fake
for i in `seq $NUM`; do
	if [ "$i" == "34" ] && [ "$JIT_FLAG" == " -jy " ];then
		continue
	fi
	if [ "$i" == "45" ] && [ "$JIT_FLAG" == " -jy " ];then
		continue
	fi
	if [ "$i" == "46" ] && [ "$JIT_FLAG" == " -jy " ];then
		continue
	fi
	if [ "$i" == "51" ] && [ "$JIT_FLAG" == " -jy " ];then
		continue
	fi
	if [ "$i" == "52" ] && [ "$JIT_FLAG" == " -jy " ];then
		continue
	fi
	echo "----------------running $i.fk----------------"
	./fake $JIT_FLAG $i.fk
	if [ $? -ne 0 ];then
		echo "----------------run $i.fk fail----------------"
		exit 1
	fi
	echo "----------------run $i.fk ok----------------"
done    

echo "all ok"
