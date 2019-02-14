line_count=0;
character_count=0;
capital_alphabet_count=0;
small_alphabet_count=0;
word_count=0;
digits_count=0;
while read p; do
  for (( i=0; i<${#p}; i++ )); do
	  if [[ "${p:$i:1}" =~ [A-Z] ]]
	  then
		capital_alphabet_count=$((capital_alphabet_count+1));
	  fi
	  if [[ "${p:$i:1}" =~ [a-z] ]]
	  then
		small_alphabet_count=$((small_alphabet_count+1));
	  fi
	  if [[ "${p:$i:1}" = [0-9] ]]
	  then
	  	digits_count=$((digits_count+1));
	  fi
	  character_count=$((character_count+1));
  done
 word_count=$((word_count+${#p[@]}));
 line_count=$((line_count+1));
done < $1
echo "line count $line_count";
echo "character count $character_count";
echo "Capital alphabet count $capital_alphabet_count";
echo "Small alphabet count $small_alphabet_count";
echo "Digits count $digits_count";
echo "word count $word_count";
