#!/bin/bash
echo "input your dir1: "
read dir1 

echo "input your dir2: "
read dir2

echo "input dir_name"
read  dir_name

if [ -d $dir_name ];then 
    echo "directory already exist" 
else
     mkdir -p -m777 $dir_name 
fi





echo "----------------------------------start-----------------------------------------"

echo "---------------------------------Only file -------------"                                                                                                                                                             
echo | diff -qrau $dir1 $dir2 |grep Only |awk '{print $3$4}'|sed 's!:!/!'                                                                                                                  
                                                                                                                                                                                           
echo "---------------------------------Differ file ------------"                                                                                                                                                            
echo | diff -qrau $dir1 $dir2 |grep differ |awk '{print $4}'    



echo | diff -qrau $dir1 $dir2 |grep Only |awk '{print $3$4}'|sed 's!:!/!' |xargs -i  cp -rf --parent {} $dir_name
echo | diff -qrau $dir1 $dir2 |grep differ |awk '{print $4}'|xargs -i  cp -rf --parent {} $dir_name


echo "end"
