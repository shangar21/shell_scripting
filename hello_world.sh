#! /bin/bash

echo "enter current grade: "
read c_grade

echo "enter final weight (as decimal): "
read f_weight

echo "enter final weight - 100(as decimal): "
read c_weight

echo "enter desired grade: "
read d_grade

echo "($d_grade - ($c_grade * (1 - $f_weight)))/$f_weight" | bc