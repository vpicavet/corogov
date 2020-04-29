#!/bin/sh

wget https://www.gouvernement.fr/info-coronavirus -O info-coronavirus.html
pandoc -f html -t markdown -s info-coronavirus.html  | grep -Ev ":::|\<div\>|\</div\>" > info-coronavirus.md
wget https://www.gouvernement.fr/info-coronavirus/strategie-de-deconfinement -O strategie-de-deconfinement.html
pandoc -f html -t markdown -s strategie-de-deconfinement.html |  grep -Ev ":::|\<div\>|\</div\>" > strategie-de-deconfinement.md
git add info-coronavirus.md
git add strategie-de-deconfinement.md
git commit -m "New official update"
git push
