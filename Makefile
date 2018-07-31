all: thesis

front_len = 9

includes := $(basename $(notdir $(wildcard inc/*.tex)))

.PHONY: $(includes)

$(includes) :
	latex thesis
	latex -jobname=int "\includeonly{inc/$@}\input{thesis}"
	biber int
	latex -jobname=int "\includeonly{inc/$@}\input{thesis}"
	pdflatex -jobname=int "\includeonly{inc/$@}\input{thesis}"
	qpdf int.pdf --empty --pages int.pdf $(front_len)-r1 -- $@.pdf
	rm int.*
	make clean

# thesis:
# 	latex thesis
# 	biber thesis
# 	latex thesis
# 	pdflatex thesis
# 	make clean


clean:
	rm -f *.aux \
               *.bbl \
               *.bcf \
               *.blg \
               *.dvi \
               *.lof \
               *.log \
               *.lot \
               *.out \
               *.toc \
	       *.run.xml

