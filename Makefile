all: thesis

front_len = 9

intro:
	@latex -interaction=batchmode thesis
	@latex -interaction=batchmode -jobname=int "\includeonly{intro}\input{thesis}"
	@biber --quiet int
	@latex -interaction=batchmode -jobname=int "\includeonly{intro}\input{thesis}"
	@pdflatex -interaction=batchmode -jobname=int "\includeonly{intro}\input{thesis}"
	@pdftk int.pdf cat $(front_len)-end output intro.pdf
	@rm int.*
	@make clean > /dev/null

bg:
	@latex -interaction=batchmode thesis
	@latex -interaction=batchmode -jobname=bgr "\includeonly{background}\input{thesis}"
	@biber --quiet bgr
	@latex -interaction=batchmode -jobname=bgr "\includeonly{background}\input{thesis}"
	@pdflatex -interaction=batchmode -jobname=bgr "\includeonly{background}\input{thesis}"
	@pdftk bgr.pdf cat $(front_len)-end output bg.pdf
	@rm bgr.*
	@make clean > /dev/null
	make clean

method:
	@latex -interaction=batchmode thesis
	@latex -interaction=batchmode -jobname=mthd "\includeonly{method}\input{thesis}"
	@biber --quiet mthd
	@latex -interaction=batchmode -jobname=mthd "\includeonly{method}\input{thesis}"
	@pdflatex -interaction=batchmode -jobname=mthd "\includeonly{method}\input{thesis}"
	@pdftk mthd.pdf cat $(front_len)-end output method.pdf
	@rm mthd.*
	@make clean > /dev/null

results:
	@latex  -interaction=batchmode thesis
	@latex  -interaction=batchmode -jobname=rslt "\includeonly{results}\input{thesis}"
	@biber --quiet rslt
	@latex  -interaction=batchmode -jobname=rslt "\includeonly{results}\input{thesis}"
	@pdflatex -interaction=batchmode -jobname=rslt "\includeonly{results}\input{thesis}"
	@pdftk rslt.pdf cat $(front_len)-end output results.pdf
	@rm rslt.*
	@make clean > /dev/null

conclusion:
	@latex -interaction=batchmode thesis
	@latex -interaction=batchmode -jobname=cnc "\includeonly{conclusion}\input{thesis}"
	@biber --quiet cnc
	@latex -interaction=batchmode -jobname=cnc "\includeonly{conclusion}\input{thesis}"
	@pdflatex -interaction=batchmode -jobname=cnc "\includeonly{conclusion}\input{thesis}"
	@pdftk cnc.pdf cat $(front_len)-end output conclusion.pdf
	@rm cnc.*
	@make clean > /dev/null

thesis:
	@latex -interaction=batchmode thesis
	@biber --quiet thesis
	@latex -interaction=batchmode thesis
	@pdflatex -interaction=batchmode thesis
	@make clean > /dev/null

noise:
	@latex thesis
	@biber thesis
	@latex thesis
	@pdflatex thesis

clean:
	@rm -f *.aux \
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

