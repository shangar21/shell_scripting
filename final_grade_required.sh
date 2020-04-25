#! /bin/bash

echo "enter current grade: "
read c_grade

echo "enter final weight (as decimal): "
read f_weight

echo "enter desired grade: "
read d_grade

grade=$(bc <<< "($d_grade - ($c_grade * (1 - $f_weight)))/$f_weight")

echo "Grade needed on final: "
echo $grade

if [ $(echo "$grade>75" | bc) -eq 1 ]
then
	echo "study up big boy u need a hella high grade"
elif [ $(echo "$grade>=50" | bc) -eq 1 ]
then
	echo "you got this in the bag, study a likkle bit dawgy"
else
	echo "you a smart ass guy u dont even have to try good on u bro"

fi