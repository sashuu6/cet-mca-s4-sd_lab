#To get the number of seats
awk -F "," ' { print $3 } ' data-folder/room-data.csv > temp_room_data;
#Sum the count of all the seats
total_room_seats=0;
while read seat_count; do
	total_room_seats=$((total_room_seats+$seat_count));
done < temp_room_data
echo "Total number of seats: $total_room_seats";
total_student_count=0;
#To get the number of 1st year students
awk -F "," ' { print $1 } ' data-folder/student_data-yr1.csv > temp_student_data;
yr1_student_count=0;
while read yr1_students; do
	yr1_student_count=$((yr1_student_count+1));
done < temp_student_data
echo "Total 1st students: $yr1_student_count";
total_student_count=$((total_student_count+yr1_student_count));
#To get the number of 2nd year students
awk -F "," ' { print $1 } ' data-folder/student_data-yr2.csv > temp_student_data;
yr2_student_count=0;
while read yr2_students; do
	yr2_student_count=$((yr2_student_count+1));
done < temp_student_data
echo "Total 2nd students: $yr2_student_count";
total_student_count=$((total_student_count+yr2_student_count));
#To get the number of 3rd year students
awk -F "," ' { print $1 } ' data-folder/student_data-yr3.csv > temp_student_data;
yr3_student_count=0;
while read yr3_students; do
	yr3_student_count=$((yr3_student_count+1));
done < temp_student_data
echo "Total 3rd students: $yr3_student_count";
total_student_count=$((total_student_count+yr3_student_count));
echo "Total student count: $total_student_count";
#Condition to check if all the number of students are equal to total seats available.
if [[ $total_room_seats -ne $total_student_count ]]
then
    echo "NOT POSSIBLE, ERROR 101";
    exit 101
fi