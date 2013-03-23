#!/bin/sh
# ^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2} <[^>]+> \s*.stupid\s*$
head -$((${RANDOM} % `wc -l < ~/ii/data/stupid` + 1)) ~/ii/data/stupid | tail -1 > ~/ii/irc.freenode.net/##the_basement/in
