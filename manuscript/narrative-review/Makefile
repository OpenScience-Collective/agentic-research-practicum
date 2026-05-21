# LaTeX build for the TiCS Forum Review narrative review.
#
# Outputs main.pdf from main.tex + refs.bib + figures/fig{1-4}.png.
# Requires: pdflatex, bibtex (TeX Live or MacTeX).

PDF = main.pdf
TEX = main.tex
BIB = refs.bib
FIGS = figures/fig1.png figures/fig2.png figures/fig3.png figures/fig4.png

all: $(PDF)

$(PDF): $(TEX) $(BIB) $(FIGS)
	pdflatex -interaction=nonstopmode $(TEX)
	bibtex main
	pdflatex -interaction=nonstopmode $(TEX)
	pdflatex -interaction=nonstopmode $(TEX)

clean:
	rm -f main.aux main.bbl main.blg main.log main.out main.spl main.toc main.fdb_latexmk main.fls main.synctex.gz

distclean: clean
	rm -f $(PDF)

.PHONY: all clean distclean
