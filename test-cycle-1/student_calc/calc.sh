count=0;
tmp=0;
tmp1=0;
awk -F "," 'total_marks= $4+$5+$6+$7+$8+$9+$10 { print total_marks } ' file.csv > temp;
while read p; do
	summ=$((summ+$p));
	count=$((count+1));
done < temp
mean=$((summ/count));

while read q; do
	tmp=$((($q-$mean)*($q-$mean)));
	tmp1=$(($tmp+$tmp1));
	tmp=0;
done < temp
var=$((tmp1/count));
sd=$(bc <<< "scale=5; sqrt($var)");
