#!/bin/sh

OPACITY=0

if [ ! -z $1 ]; then
    OPACITY=`echo "scale=1; ${1}" | bc -l | awk '{printf "%.2f\n", $0}'`
fi

if [ `echo "${OPACITY} == 0" | bc` -eq 1 ];then
    exit 1
fi

if [ `echo "${OPACITY} > 1" | bc` -eq 1 ];then
    exit 1
fi

sed -i "" "s/background_opacity: [0-9]\.[0-9]/background_opacity: ${OPACITY}/g" ${XDG_CONFIG_HOME}/alacritty/alacritty.yml
