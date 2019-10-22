#!/usr/bin/env bash
name=main
latexmk -pdf $name.tex
excode=$?
if [ $excode -eq 0 ]; then
  latexmk -pdf $name.tex
  # gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$name-compressed.pdf $name.pdf
  # mv $name-compressed.pdf $name.pdf
  exit 0
else
  if [ -e $name.pdf ]; then rm $name.pdf; fi
  exit $excode
fi
