for (( i=$1+1; i<=$2-1; i++ ))
do
	echo `sed -n "$i"p "$3"`;
done
