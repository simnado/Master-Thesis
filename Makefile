all: pdf

pdf: Makefile
	pdflatex thesis && makeglossaries thesis && sudo biber thesis && sudo pdflatex thesis

