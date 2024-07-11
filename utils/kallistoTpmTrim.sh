#!/bin/bash

#awk '$5 >= 1 { print }'

cd kallistoOutput

for i in *.tsv; do
  awk '$5 >= 1 { print }' $i > trimmed_${i} 
done
