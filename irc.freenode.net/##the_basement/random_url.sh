#!/bin/sh
# ^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2} <[^>]+> \s*.url\s*$
head -$((${RANDOM} % `wc -l < ~/ii/data/url_log` + 1)) ~/ii/data/url_log | tail -1 > ~/ii/irc.freenode.net/##the_basement/in
