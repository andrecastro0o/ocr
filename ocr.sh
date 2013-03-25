#!/bin/sh

#needs: pdftk, imagemagick and tesseract-ocr
#pdf should be 300dpi or higher resolution

pdftk $1 burst #splits a pdf document into single pages named pg_0*.pdf

#convert each pdf page
#1:from pdf to 8bit 300dpi tifs # this takes a while
for i in pg*.pdf
do
convert -units pixelsperinch -density 300x300 -colorspace Gray -depth 8 $i "`basename $i .p\
df`.tif"
done;

#2:from gray-scale tif to monochorome tif
for i in pg*.tif
do
convert $i +dither -monochrome -normalize "`basename $i .tif`-m.tif"
done;

#3:character recognition with tesseract
for i in *-m.tif
do
tesseract $i "`basename $i .tif`"
done;

#4: cat ocr text content under 1 file
DUMP=`basename $1 .pdf`.txt;#replace sufix .pdf to .txt
echo ==== $DUMP is the file with text content ====;
touch $DUMP; #create a new txt file
cat pg*.txt >> $DUMP;

#5: garbage collect
echo ==== moving old files to transh/ ====;
mkdir trash;
mv pg* trash;