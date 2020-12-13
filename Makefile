INPUT_PATH := /documents
OUTPUT_PATH := /out/thesis

all: html pdf

html: Makefile pre
	asciidoctor -r asciidoctor-diagram -r asciidoctor-bibtex -D $(OUTPUT_PATH) main.adoc

epub: Makefile pre
	asciidoctor-epub3 -r asciidoctor-mathematical -r asciidoctor-diagram -r asciidoctor-bibtex main.adoc && mv ./main.epub $(OUTPUT_PATH)/main.epub

pdf: Makefile pre
	asciidoctor-pdf -r asciidoctor-mathematical -r asciidoctor-diagram -r asciidoctor-bibtex -a imagesdir=/out/thesis/img -a allow-uri-read --verbose main.adoc && mv ./main.pdf $(OUTPUT_PATH)/main.pdf

tex: Makefile pre
	asciidoctor-latex -r asciidoctor-diagram -r asciidoctor-bibtex -a imagesdir=/out/thesis/img -a allow-uri-read --verbose main.adoc && mv ./main.tex $(OUTPUT_PATH)/main.tex

pre: Makefile
	cp -r $(INPUT_PATH)/img/ $(OUTPUT_PATH)
