j=`expr 0`
for file in `ls ../sites-available`; do
j=`expr $j + 1`
ln -s ../sites-available/$file $j-$file 
done
