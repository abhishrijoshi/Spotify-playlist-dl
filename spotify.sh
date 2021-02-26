for i in *csv ; do 
	$(mkdir "${i%.*}" && mv "$i" "${i%.*}")
    $(cut -d, -f2,4 "./${i%.*}"/*.csv > ""./${i%.*}"/$i.a") 
	$(  cat ""./${i%.*}"/$i.a" | tr -d '[:punct:]' > ""./${i%.*}"/$i.s.txt")
	$(sed -i -n -e '2,$p' ""./${i%.*}"/$i.s.txt")
	$(cd "./${i%.*}" && $(xargs -L 1  ytfzf  -a -d  < *txt ))
    $(rm *txt) 
done
