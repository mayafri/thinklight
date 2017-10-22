#!/bin/bash

if test $# -lt 5; then
    echo 'Syntaxe : durée_on durée_off durée_repétitions nb_seq nb_répétitions'
else
    i=0
    j=0

    fin=$4
    fintotal=$5
    duree1=$1
    duree2=$2
    duree3=$3

    sequence() {
        while test $i -lt $fin; do
            echo 1 > /sys/class/leds/tpacpi\:\:thinklight/brightness 
            sleep $duree1
            echo 0 > /sys/class/leds/tpacpi\:\:thinklight/brightness
            sleep $duree2
            ((i++))
        done
    }

    while test $j -lt $fintotal; do
        i=0;
        sequence
        sleep $duree3
        ((j++))
    done
fi
