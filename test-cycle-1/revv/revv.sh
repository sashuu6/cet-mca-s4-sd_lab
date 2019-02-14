echo "Menu:-";
echo "1. Convert lowercase to uppercase.";
echo "2. Reverse the lines of the file.";
echo "Enter choice";
read ch;
echo "Enter file name 1: ";
read f1;
echo "Enter file name 2: ";
read f2;
if [[ $(diff $f1 $f2) = "" ]]; 
then
	if [ $ch == 1 ]
	then
		echo `tr "[:lower:]" "[:upper:]" < $f1` > file3;
	fi
	if [ $ch == 2 ]
        then
                echo `tac  $f2 > file3`;
        fi
fi
