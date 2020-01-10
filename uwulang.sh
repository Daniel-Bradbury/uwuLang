if [[ 1 == 1 ]] 2> /dev/null; then
  echo compiling...
  file=$1
  echo 'def c#~x~#:' > TEMP.py
  echo '  str=""' >> TEMP.py
  echo '  for i in range#~0,ord#~x~#~#:' >> TEMP.py
  echo '    str=str+"+"' >> TEMP.py
  echo '  return str' >> TEMP.py
  
  echo -n 'print#~"""' >> TEMP.py
  cat $1 >> TEMP.py
  if [ -f "$file" ]; then
    sed -i -e 's/>w> />>/g' TEMP.py
    sed -i -e 's/<w< /<</g' TEMP.py
    sed -i -e 's/uwu /+/g' TEMP.py
    sed -i -e 's/owo /-/g' TEMP.py
    sed -i -e 's/>w< /,/g' TEMP.py
    sed -i -e 's/uou /./g' TEMP.py
    sed -i -e 's/>w< /,/g' TEMP.py
	
	sed -i -e 's/{/[/g' TEMP.py
    sed -i -e 's/}/]/g' TEMP.py
	
    sed -i -e 's/(/>[-]"""+c("/g' TEMP.py
    sed -i -e 's/)/"\)+""".[-]</g' TEMP.py
	
	echo -n '"""~#' >> TEMP.py
	
	sed -i -e 's/~#/)/g' TEMP.py
	sed -i -e 's/#~/(/g' TEMP.py
	
	python3 TEMP.py > $1.bf
	rm TEMP.py
  else
    if [[ $file == "" ]]; then
      echo Usage: bash uncommentator.sh [file]
    else
      echo File \"$1\" not found
    fi
  fi
  echo done.
else
  echo Incorrect usage detected: Please use bash instead of sh
fi