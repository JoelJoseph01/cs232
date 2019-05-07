Joel Joseph 
S4 D,29
#!/bin/sh
pdftotext -nopgbrk s1.pdf
grep --no-group-separator -A3 'CHN17CS' s1.txt | tr '\n' ' ' | sed 's/\ CHN/\nCHN/g' > res.txt
sed -i 's/(O)/ 10  /g' res.txt
sed -i 's/(A+)/ 9  /g' res.txt
sed -i 's/(A)/ 8.5  /g' res.txt
sed -i 's/(B+)/ 8  /g' res.txt
sed -i 's/(B)/ 7  /g' res.txt
sed -i 's/(C)/  6  /g' res.txt
sed -i 's/(P)/  5  /g' res.txt
sed -i 's/(F)/  0  /g' res.txt
sed -i 's/(FE)/  0  /g' res.txt
sed -i 's/(I)/ 0 /g' res.txt
awk '{s=$3*4+$6*4+$9*4+$12*3+$15*3+$18*3+$21*1+$24*1+$27*1}{r=s/24}{print r}' res.txt >sgp1.txt
awk '{print $1}' res.txt >reg.txt
paste -d ' \t ' reg.txt sgp1.txt >res.txt
awk 'NR==FNR {seen[$3]=1; next} seen[$1]==1 {seen[$2]++; print $2}' s4d.txt res.txt >sgpa1.txt
awk '{print $3}' s4d.txt >reg1.txt
paste -d ' \t ' reg1.txt sgpa1.txt >s1res.txt
pdftotext -nopgbrk s2.pdf
grep --no-group-separator -A3 'CHN17CS' s2.txt | tr '\n' ' ' | sed 's/\ CHN/\nCHN/g' > res1.txt
sed -i 's/(O)/ 10  /g' res1.txt
sed -i 's/(A+)/  9  /g' res1.txt
sed -i 's/(A)/  8.5  /g' res1.txt
sed -i 's/(B+)/  8  /g' res1.txt
sed -i 's/(B)/  7  /g' res1.txt
sed -i 's/(C)/  6  /g' res1.txt
sed -i 's/(P)/  5  /g' res1.txt
sed -i 's/(F)/  0  /g' res1.txt
sed -i 's/(FE)/  0  /g' res1.txt
sed -i 's/(I)/ 0 /g' res1.txt
awk '{s=$3*4+$6*3+$9*3+$12*1+$15*1+$18*4+$21*3+$24*3+$27*1}{r=s/23}{print r}' res1.txt >s2sgp1.txt
awk '{print $1}' res1.txt >reg2.txt
paste -d ' \t ' reg2.txt s2sgp1.txt >resu.txt
awk 'NR==FNR {seen[$3]=1; next} seen[$1]==1 {seen[$2]++; print $2}' s4d.txt resu.txt >sgpa2.txt
awk '{print $3}' s4d.txt >reg1.txt
paste -d ' \t ' reg1.txt sgpa2.txt >s2final.txt
paste -d ' \t ' s1res.txt sgpa2.txt >s1_s2.txt
awk '{s=$2+$3}{r=s/2}{print r}' s1_s2.txt >cgp1.txt
paste -d ' \t ' reg1.txt cgp1.txt >final_cgp1.txt
awk '{print $4}' s4d.txt >name.txt
echo "Reg no.  Name  s1 sgpa  s2 sgpa  Final cgpa"
paste -d ' \t  \t ' reg1.txt name.txt >1.txt
paste -d ' \t  \t ' 1.txt sgpa1.txt >2.txt
paste -d ' \t  \t ' 2.txt sgpa2.txt >3.txt
paste -d ' \t  \t ' 3.txt cgp1.txt >final.txt
echo
cat final.txt


   


