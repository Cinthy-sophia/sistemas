datos2>datos2
datosTotal>datosTotal
cat $1 | cut -d " " -f1 | sort | uniq >> datos2
cat datos2

while read nombre tiempo
do
	while read nombreC
	do
		if [ $nombre = $nombreC ]
		then
			horas=`echo $tiempo| cut -d ":" -f1`
			minutos=`echo $tiempo| cut -d ":" -f2`
			segundos=`echo $tiempo| cut -d ":" -f3`

			while [ $segundos -ge 60 ]
			do
				minutos=$(($minutos+1))
				segundos=$(($segundos-60))
			done
			while [ $minutos -ge 60 ]
                       do
                                horas=$(($horas+1))
                                minutos=$(($minutos-60))
                        done

			total="$nombre $horas:$minutos:$segundos"

			echo $total

		fi
	done < datos2
done < $1

#cat datosRep | sort | uniq >> datosTotal

#cat datosTotal
