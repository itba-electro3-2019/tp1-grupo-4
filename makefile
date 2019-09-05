# Makefile para compilar latex
#

#Nombre del informe
INFORME = informe
#Archivos secundarios a eliminar
OTHER = *.aux *.gz *.log *.toc

informe: $(INFORME).tex
	pdflatex -synctex=1 -interaction=nonstopmode $(INFORME).tex
	rm -rf $(OTHER)
