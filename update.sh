#!/bin/sh

wget https://www.gouvernement.fr/info-coronavirus -O info-coronavirus.html
pandoc -f html -t markdown -s info-coronavirus.html  | grep -Ev ":::|\<div\>|\</div\>" > info-coronavirus.md
git add info-coronavirus.md
git ci -m "New official update"
git push
