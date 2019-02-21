count=0;
awk -F "," 'total_marks= $4+$5+$6+$7+$8+$9+$10 { print total_marks } ' file.csv > temp
while read p; do
	summ=$((summ+$p));
	count=$((count+1));
done < temp
mean=$((summ/count));

while read p; do 
	
done
