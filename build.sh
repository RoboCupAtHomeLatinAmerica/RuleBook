#!/bin/bash

# install texlive before run this script
# sudo apt-get update
# sudo apt-get install -y texlive*

file="${1:-Rulebook}"

pdflatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=build ${file}.tex
makeglossaries -d build ${file}
biber build/${file}
makeindex build/${file}.idx
pdflatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=build ${file}.tex