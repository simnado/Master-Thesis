all: pdf

pdf: Makefile
	pdflatex thesis && sudo biber thesis && pdflatex thesis

