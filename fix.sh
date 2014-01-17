#!/bin/sh
for i in php javascript bash css java scala
do
  sed -i -e 's/(<div>)?\['$i'\]/```'$i'/g' *.md
  sed -i -e 's/\[\/'$i'\](<\/div>)?/```/g' *.md
done
