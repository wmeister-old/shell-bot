#!/bin/sh
# ^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2} <[^>]+> \s*.fudd\s*$
head -$((${RANDOM} % `wc -l < ~/ii/data/fudd` + 1)) ~/ii/data/fudd | tail -1 > ~/ii/irc.freenode.net/##the_basement/in
