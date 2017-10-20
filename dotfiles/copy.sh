#!/bin/bash

for i in `grep FILE README.md | sed s/FILE//g`
do
  cp -a $i ~/
done
