
echo "Enter file name 1: ";
read f1;
echo "Enter file name 2: ";
read f2;
if [[ $(diff $f1 $f2) = "" ]]; 
then
	echo `tr "[:lower:]" "[:upper:]" < $f1` > file3;
	echo "Converted lowercase to uppercase";
else
	echo `tac  $f2 > file3`
	echo "Reversed the lines of the file";
fi
