line_count=0
character_count=0
alphabet_count=0
while read p; do
  for (( i=0; i<${#p}; i++ )); do
	  if [[ "${p:$i:1}" = [a-z] ]]
	  then
		alphabet_count=$((alphabet_count+1))
	  fi
	   character_count=$((character_count+1))
  done
 line_count=$((line_count+1))
done < $1
echo "line count $line_count"
echo "character count $character_count"
echo "alphabet count $alphabet_count"
