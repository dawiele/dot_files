#!/bin/sh
# usage: ddp source dest
cat ${1} | pv -brtp -s `du -b ${1}` | dd of=${2} bs=4096
