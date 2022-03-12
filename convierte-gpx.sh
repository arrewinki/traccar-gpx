#!/bin/bash

# INSTRUCCIONES!!!
# Pegar en fichero input las columnas C y D del report.xlsx del export de la ruta del traccar

> output1
> output2
> body

sed -i s/,/./g input

for i in $(cat input|awk '{print $1}') ; do echo "      <trkpt lat=\"$i\""; done > output1
for i in $(cat input|awk '{print $2}') ; do echo  "lon=\"$i\"><ele>0</ele><time>2020-10-10T10:10:10Z</time></trkpt>" ; done > output2


paste output1 output2 > body

cat header.xml body footer > ruta-`date "+%Y-%m"`.gpx
