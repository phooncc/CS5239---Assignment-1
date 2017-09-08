for((i=100;i<=3000;i+=100))
do
    perf stat ./mm $i | tee $i
done
