#!/bin/bash


read -p "Please Enter First Number: " A
read -p "please Enter Secound Number: " B
read -p " Please Select an Opretor (+ * - /): " op

if [ "$op" = "/" ]; then 
	echo "scale=2; $A / $B" | bc
else 
	echo "$A $op $B" | bc 
fi

