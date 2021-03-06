#!/bin/bash

for f in `ls docx/*.docx`
do
  OUT1=$(echo $f | sed 's/\([[:digit:]]*\).docx/\1.xml/')
  OUT2=$(echo $OUT1 | sed 's/docx\///')
  if [ ! -f $OUT2 ]; then
    /opt/stylesheets/bin/docxtotei $f $OUT1
  fi
  saxon -s:$OUT1 -xsl:xslt/process-new.xsl -o:$OUT2
  rm $OUT1
done