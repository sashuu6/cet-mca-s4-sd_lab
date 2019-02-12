while :
do
	echo -e "Calculator\n1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n5.Exit";
	echo "Enter your choice";
	read ch;
	if [ $ch == 1 ]
	then
		echo "Addition";
		echo "Enter value 1: ";
		read v1;
		echo "Enter value 2: ";
		read v2;
		result=$((v1+v2)); 
		echo "Result: $result";
	fi
	if [ $ch == 2 ]
	then
		echo "Subtraction";
		echo "Enter value 1: ";
		read v1;
		echo "Enter value 2: ";
		read v2;
		result=$((v1-v2)); 
		echo "Result: $result";
	fi
	if [ $ch == 3 ]
	then
		echo "Multiplication";
		echo "Enter value 1: ";
		read v1;
		echo "Enter value 2: ";
		read v2;
		result=$((v1*v2)); 
		echo "Result: $result";
	fi
	if [ $ch == 4 ]
	then
		echo "Subtraction";
		echo "Enter value 1: ";
		read v1;
		echo "Enter value 2: ";
		read v2;
		result=$((v1/v2)); 
		echo "Result: $result";
	fi
	if [ $ch == 5 ]
	then
		exit 1;
	fi
done
