#!/bin/sh
for i in php javascript bash css java scala
do
  sed -i -e 's/\['$i'\]/```'$i'/g' *.md
  sed -i -e 's/\[\/'$i'\]/```/g' *.md
done

sed -i -e 's/^<div>```/```/g' *.md
sed -i -e 's/```<\/div>$/```/g' *.md
