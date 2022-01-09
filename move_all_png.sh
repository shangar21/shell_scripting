#!/bin/bash

for f in $(find . -type f -name "*.png")
do
	mv $f DF2K_HR/
done
