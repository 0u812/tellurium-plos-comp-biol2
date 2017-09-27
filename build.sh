#!/usr/bin/bash

set -e
set -o verbose

cd "$( dirname "${BASH_SOURCE[0]}" )"
THIS_DIR=`pwd`

mkdir -p /tmp/tepcb/tex/
cd $_
rsync --exclude .git -av $THIS_DIR/ .
pdflatex -interaction nonstopmode --halt-on-error main.tex
set +e
bibtex main
set -e
pdflatex -interaction nonstopmode --halt-on-error main.tex
pdflatex -interaction nonstopmode --halt-on-error main.tex
evince main.pdf &