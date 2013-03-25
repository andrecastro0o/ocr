#ocr
===
## Short Description
pdf to txt ocr shell script

===
## Description
This is a simple shell script for character-recognize text from an image pdf and outputs it into a .txt file

Hope it might be useful for some of you. 
And if you'd like to push new developments, that would be great :]

====
## Programs needed
Its main component is **tesseract-ocr**.

Beside tesseract-orc the script makes use of:
* **pdftk** - to burst the pdf into single page pdfs
* **imagemagick** - to convert the pdf to tiff (tesseract only accepts .tif inputs)

