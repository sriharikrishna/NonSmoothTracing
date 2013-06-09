TARGET=tracing

FIGFILES=$(wildcard *.fig)
FIG2PDF=$(FIGFILES:.fig=.pdf)

EXTRAREQS= \
versionInfo.txt \
$(FIG2PDF) \
tracingAlgOpts.ftxt \
oneMinuteStatusOutput.txt \
Code/OneMinuteExample/oad_tr_001.xml \
Code/OneMinuteExample/oad_tr_002.xml \
Code/ControlFlow/oad_tr_001.xml \
Code/ControlFlow/oad_tr_002.xml \
Code/ArrayIndex/oad_tr_001.xml \
Code/ArrayIndex/oad_tr_002.xml \
Code/CallStack/oad_tr_001.fxml \
Code/CallStack/oad_tr_002.fxml 

THISDIR=$(shell pwd)


ifndef OPENADROOT
$(error "OpenAD environment not set")
endif

ifdef NOFORCE
FORCE=
else
FORCE=FORCE
endif

PORTRAIT_ORIENT_BOX_WIDTH=86

$(TARGET).pdf : $(TARGET).aux $(TARGET).blg $(TARGET).bbl
# run it twice
	pdflatex $(TARGET)
	pdflatex $(TARGET)

extraReqs: $(EXTRAREQS)
	echo $(EXTRAREQS)

versionInfo.txt versionInfoOpenAD.txt : $(FORCE) 
	./createVersionInfo.sh

tracingAlgOpts.txt : $(FORCE)
	${OPENADROOT}/xaifBooster/algorithms/TraceDiff/driver/oadDriver | grep -v "caught exception" | grep -v "=== reset log" | grep -v "xaifBooster/algorithms/TraceDiff/driver" > ${THISDIR}/$@

tracingAlgOpts.ftxt : tracingAlgOpts.txt
	cat $< | ${THISDIR}/fold.py -p '                 ' -w $(PORTRAIT_ORIENT_BOX_WIDTH) > ${THISDIR}/$@

oneMinuteStatusOutput.txt : $(FORCE)
	./createOneMinuteOutput.sh

Code/OneMinuteExample/oad_tr_001.xml Code/OneMinuteExample/oad_tr_002.xml : 
	cd Code/OneMinuteExample && $(MAKE)

Code/ControlFlow/oad_tr_001.xml Code/ControlFlow/oad_tr_002.xml : 
	cd Code/ControlFlow && $(MAKE)

Code/ArrayIndex/oad_tr_001.xml Code/ArrayIndex/oad_tr_002.xml : 
	cd Code/ArrayIndex && $(MAKE)

Code/CallStack/oad_tr_001.xml Code/CallStack/oad_tr_002.xml : 
	cd Code/CallStack && $(MAKE) 

%.fxml: %.xml
	./xmlformat.pl $< > $@

$(TARGET).aux :  extraReqs $(TARGET).tex $(TARGET).bib 
# ensure we make a .aux file
	pdflatex $(TARGET)

$(TARGET).blg $(TARGET).bbl: $(TARGET).aux
	bibtex $(TARGET)

%.pdf: %.fig
	fig2dev -L pdf $< $@ 

clean: 
	rm -f *~ *bak $(TARGET).{toc,aux,ps,pdf,out,log,lof,lot,bbl,blg,dvi} $(EXTRAREQS)
	cd Code/OneMinuteExample && $(MAKE) clean
	cd Code/ControlFlow && $(MAKE) clean
	cd Code/ArrayIndex && $(MAKE) clean
	cd Code/CallStack && $(MAKE) clean

.PHONY: clean extraReqs

FORCE: 

