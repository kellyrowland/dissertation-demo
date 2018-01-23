all: thesis

front_len = 8

intro:
	latex thesis
	latex -jobname=int "\includeonly{intro}\input{thesis}"
	biber int
	latex -jobname=int "\includeonly{intro}\input{thesis}"
	pdflatex -jobname=int "\includeonly{intro}\input{thesis}"
	pdftk int.pdf cat $(front_len)-end output intro.pdf
	rm int.*
	make clean

bg:
	latex thesis
	latex -jobname=bgr "\includeonly{background}\input{thesis}"
	biber bgr
	latex -jobname=bgr "\includeonly{background}\input{thesis}"
	pdflatex -jobname=bgr "\includeonly{background}\input{thesis}"
	pdftk bgr.pdf cat $(front_len)-end output bg.pdf
	rm bgr.*
	make clean

method:
	latex thesis
	latex -jobname=mthd "\includeonly{method}\input{thesis}"
	biber mthd
	latex -jobname=mthd "\includeonly{method}\input{thesis}"
	pdflatex -jobname=mthd "\includeonly{method}\input{thesis}"
	pdftk mthd.pdf cat $(front_len)-end output method.pdf
	rm mthd.*
	make clean

results:
	latex thesis
	latex -jobname=rslt "\includeonly{results}\input{thesis}"
	biber rslt
	latex -jobname=rslt "\includeonly{results}\input{thesis}"
	pdflatex -jobname=rslt "\includeonly{results}\input{thesis}"
	pdftk rslt.pdf cat $(front_len)-end output results.pdf
	rm rslt.*
	make clean

conclusion:
	latex thesis
	latex -jobname=cnc "\includeonly{conclusion}\input{thesis}"
	biber cnc
	latex -jobname=cnc "\includeonly{conclusion}\input{thesis}"
	pdflatex -jobname=cnc "\includeonly{conclusion}\input{thesis}"
	pdftk cnc.pdf cat $(front_len)-end output conclusion.pdf
	rm cnc.*
	make clean

thesis:
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

