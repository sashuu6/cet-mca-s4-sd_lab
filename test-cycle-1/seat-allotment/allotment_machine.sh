#To get the number of seats
awk -F "," ' { print $3 } ' data-folder/room-data.csv > temp_room_data;
#Sum the count of all the seats
total_room_seats=0;
total_room_count=0;
while read seat_count; do
	total_room_seats=$((total_room_seats+$seat_count));
	total_room_count=$((total_room_count+1));
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
#Condition to check if the total number of students are equal to total seats available.
#To get room name
room_collection_name=( $(cut -d ',' -f2 data-folder/room-data.csv ))
#To get room size (number of seats)
room_collection_size=( $(cut -d ',' -f3 data-folder/room-data.csv ) );
#To get yr1 student name
yr1_student_name=( $(cut -d ',' -f2 data-folder/student_data-yr1.csv ) );
#To get yr2 student name
yr2_student_name=( $(cut -d ',' -f2 data-folder/student_data-yr2.csv ) );
#To get yr3 student name
yr3_student_name=( $(cut -d ',' -f2 data-folder/student_data-yr3.csv ) );
#To print design sheet
yr1=0;
yr2=0;
yr3=0;
for i in `seq 0 $((${total_room_count[@]}-1))`
do
	echo "Room name: ${room_collection_name[i]}";
	for j in `seq 0 $((${room_collection_size[i]}-1))`
	do
        if [[ $(($j%2)) -eq 0 ]]
        then
			if [[ $(($i%2)) -eq 0 ]]
			then
				if [[ $yr1 -lt ${#yr1_student_name[@]} ]]
		    	then
			    	echo "yr1 ${yr1_student_name[yr1]}";
			    	yr1=$(($yr1+1));
            	elif [[ $yr1 -eq ${#yr1_student_name[@]} ]]
            	then
                	echo "yr3 ${yr1_student_name[yr3]}";
                	yr3=$(($yr3+1));
            	fi
			else
				if [[ $yr2 -lt ${#yr2_student_name[@]} ]]
		    	then
			    	echo "yr2 ${yr2_student_name[yr2]}";
			    	yr2=$(($yr2+1));
            	elif [[ $yr2 -eq ${#yr2_student_name[@]} ]]
            	then
                	echo "yr3 ${yr1_student_name[yr3]}";
                	yr3=$(($yr3+1));
            	fi
			fi
        elif [[ $(($j%2)) -eq 1 ]]
        then
			if [[ $(($i%2)) -eq 0 ]]
			then
				if [[ $yr2 -lt ${#yr2_student_name[@]} ]]
		    	then
			    	echo "yr2 ${yr2_student_name[yr2]}";
			    	yr2=$(($yr2+1));
		    	fi
			else
				if [[ $yr3 -lt ${#yr3_student_name[@]} ]]
		    	then
			    	echo "yr3 ${yr3_student_name[yr3]}";
			    	yr3=$(($yr3+1));
		    	fi
			fi
        fi
	done 
done #> seat_allotment
