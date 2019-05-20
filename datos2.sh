resta= $1
num= 59
while test $resta -gt $num
do
        echo "true"
	resta=`expr $resta - 1`
done
echo $resta
