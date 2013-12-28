PDFLATEX = pdflatex

DEPS1 = links.tex routines.tex udf_sp_ref.tex faq.tex scripts.tex
DEPS2 = routines.tex udf_sp_ref.tex

CLEANFILES = *.aux *.log *~ *.blg *.bbl *.dvi *.toc *.out *.pdf *_info.tex

all: mod_authnz_ibmdb2.pdf db2-hash-routines.pdf

mod_authnz_ibmdb2.pdf: mod_authnz_ibmdb2.tex $(DEP1)
	./genInfo.sh $@
	$(PDFLATEX) mod_authnz_ibmdb2.tex
	$(PDFLATEX) mod_authnz_ibmdb2.tex
	
db2-hash-routines.pdf: db2-hash-routines.tex $(DEP2)
	./genInfo.sh $@
	$(PDFLATEX) db2-hash-routines.tex
	$(PDFLATEX) db2-hash-routines.tex

.PHONY: clean

clean:
	rm -f $(CLEANFILES)
