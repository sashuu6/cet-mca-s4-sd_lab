#To get the number of seats
awk -F "," ' { print $3 } ' data-folder/room-data.csv > temp_room_data;
#Sum the count of all tyhe seats
total_room_seats=0;
while read seat_count; do
	total_room_seats=$((total_room_seats+$seat_count));
done < temp_room_data
echo "$total_room_seats"