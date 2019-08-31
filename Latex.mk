######################
# Makefile for LaTeX #
######################
#To call it from console you must tipe "make TARGET="TP1_EJ4" -f Latex.mk" were TARGET is optional
#We avoid not running it, in case a file name clean actually exist
.PHONY: clean
#We confirm that as deafault we run Informe
.DEFAULT_GOAL := informe
#Remembered you must give the name of the file in case that it is not the one given by default in TARGET.
TARGET ?= Informe
#Name of the compiler
COMPILER =latexmk
#Extra variables that you can give the compiler
OPTIONS =-synctex=1 -interaction=nonstopmode -file-line-error -pdf
#Others is all the file that a compilation give but are not important adn are going to be erase later by rm command
OTHER = *~ *.aux *.dvi *.toc *.bbl *.blg *.gz *.out *.thm *.ps *.idx *.ilg *.ind *.log *.fdb_latexmk *.fls

informe: $(TARGET).tex
	$(COMPILER) $(OPTIONS) $(TARGET).tex
	rm -rf $(OTHER)
clean:	
	rm -rf $(OTHER)