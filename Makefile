LATEX       = pdflatex
BASH        = bash -c
ECHO        = echo
RM          = rm -rf
TMP_SUFFS   = pdf aux bbl blg log dvi ps eps out toc lof lot
CHECK_RERUN =

all: thesis.pdf

thesis.pdf: *.tex *.bib
	${LATEX} thesis
	bibtex thesis
	${LATEX} thesis
	( grep Rerun thesis.log && ${LATEX} thesis ) || echo "Done."
	( grep Rerun thesis.log && ${LATEX} thesis ) || echo "Done."

clean:
	${RM} $(foreach suff, ${TMP_SUFFS}, thesis.${suff})
