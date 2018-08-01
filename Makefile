
includes := $(basename $(notdir $(wildcard chp/*.tex)))

.PHONY : all
all : thesis

.PHONY : $(includes)
$(includes) :
	latex thesis
	latex -jobname=int "\includeonly{chp/$@}\input{thesis}"
	biber int
	latex -jobname=int "\includeonly{chp/$@}\input{thesis}"
	pdflatex -jobname=int "\includeonly{chp/$@}\input{thesis}"
	qpdf int.pdf --empty --pages int.pdf 1-z -- $@.pdf
	rm int.*
	make clean

.PHONY : thesis
thesis :
	latex thesis
	biber thesis
	latex thesis
	pdflatex thesis
	make clean


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

