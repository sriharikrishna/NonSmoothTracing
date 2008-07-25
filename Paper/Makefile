TARGET=tracing

FIGFILES=$(wildcard *.fig)
FIG2PDF=$(FIGFILES:.fig=.pdf)

EXTRAREQS=versionInfo.txt versionInfoR.txt $(FIG2PDF) tracingAlgOpts.txt OneMinuteStatusOutput.txt

THISDIR=$(shell pwd)


ifndef OPENADROOT
$(error "environment variable OPENADROOT undefined")
endif

$(TARGET).pdf : $(TARGET).aux $(TARGET).blg $(TARGET).bbl
	# run it twice
	pdflatex $(TARGET)
	pdflatex $(TARGET)

extraReqs: $(EXTRAREQS)
	echo $(EXTRAREQS)

versionInfo.txt versionInfoR.txt : FORCE 
	./createVersionInfo.sh

tracingAlgOpts.txt : FORCE
	./createOptionsOuput.sh 

OneMinuteStatusOutput.txt : FORCE
	./createOneMinuteStatusOutput.sh

$(TARGET).aux :  extraReqs $(TARGET).tex $(TARGET).bib 
	# ensure we make a .aux file
	pdflatex $(TARGET)

$(TARGET).blg $(TARGET).bbl: $(TARGET).aux
	bibtex $(TARGET)

%.pdf: %.fig
	fig2dev -L pdf $< $@ 

clean: 
	rm -f *~ *bak $(TARGET).{toc,aux,ps,pdf,out,log,lof,lot,bbl,blg,dvi} $(EXTRAREQS)

.PHONY: clean extraReqs

FORCE: 

