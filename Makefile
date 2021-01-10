all: pdf

pdf: Makefile
	sudo pdflatex thesis && makeglossaries thesis && sudo biber thesis && sudo pdflatex thesis

monochrome: Makefile
	gs -o - -sDEVICE=inkcov /Users/simonnarendorf/Documents/Projects/soccer-action-classification/Thesis/thesis.pdf | grep -v "^ 0.00000  0.00000  0.00000" | grep "^ " | wc -l

convert: Makefile
	gs -sOutputFile=grayscale.pdf -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH fig/collection.eps