cat $1 | cut -d " " -f1 | sort | uniq >> datos2

while read nombre tiempo
do
	while read nombreC
	do
		if [ $nombre = $nombreC ] 
		then
			horas=`echo $1| cut -d ":" -f1`
			minutos=`echo $1 | cut -d ":" -f2`
			segundos=`echo $1 | cut -d ":" -f3`

			while test $segundos -gt 59
			do
				minutos= `expr $minutos+1`
				segundos= `expr $segundos-60`	
			done
			
			while test $minutos -gt 59   
                        do
                                horas= `expr $horas+1`
                                minutos= `expr $minutos-60`
                        done

			total= $nombre " = " $horas":"$minutos":"$segundos
			echo $total			

		fi
	done < datos2
done < $1

