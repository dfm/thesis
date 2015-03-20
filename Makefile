LATEX       = pdflatex
BASH        = bash -c
ECHO        = echo
RM          = rm -rf
TMP_SUFFS   = pdf aux bbl blg log dvi ps eps out toc lof lot
CHECK_RERUN =

all: thesis.pdf abstractpage.pdf

thesis.pdf: *.tex chapters/*.tex *.bib
	${LATEX} thesis
	bibtex thesis
	${LATEX} thesis
	( grep Rerun thesis.log && ${LATEX} thesis ) || echo "Done."
	( grep Rerun thesis.log && ${LATEX} thesis ) || echo "Done."

abstractpage.pdf: abstract.tex abstractpage.tex
	${LATEX} abstractpage
	( grep Rerun abstractpage.log && ${LATEX} abstractpage ) || echo "Done."
	( grep Rerun abstractpage.log && ${LATEX} abstractpage ) || echo "Done."

clean:
	${RM} $(foreach suff, ${TMP_SUFFS}, thesis.${suff})
	${RM} $(foreach suff, ${TMP_SUFFS}, abstractpage.${suff})
