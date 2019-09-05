# Makefile para compilar latex
#

#Nombre del informe
INFORME = informe
#Archivos secundarios a eliminar
OTHER = *~ *.aux *.dvi *.toc *.bbl *.blg *.gz *.out *.thm *.ps *.idx *.ilg *.ind *.log *.fdb_latexmk *.fls

informe: $(INFORME).tex
	pdflatex -synctex=1 -interaction=nonstopmode $(INFORME).tex
	rm -rf $(OTHER)
