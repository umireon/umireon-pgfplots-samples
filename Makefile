.PHONY: all clean

all: gnuplot-cairolatex.pdf pgfplots-lualatex-simple.pdf pgfplots-lualatex-tikz.pdf pgfplots-lualatex-tikz2.pdf pgfplots-lualatex-snowman.pdf

gnuplot-cairolatex.pdf: gnuplot-cairolatex.tex gnuplot-cairolatex-inc.pdf
	lualatex --shell-escape $<

gnuplot-cairolatex.tex: gnuplot-cairolatex.gp
	gnuplot $<

pgfplots-%.pdf: pgfplots-%.tex
	lualatex --shell-escape $<

GENERATED_FILES := *.aux *.fdb_latexmk *.fls *.log *.pgf-plot.* *.synctex.gz
GENERATED_FILES += gnuplot-cairolatex.pdf gnuplot-cairolatex.tex gnuplot-cairolatex-inc.pdf
GENERATED_FILES += pgfplots-*.pdf

clean:
	$(RM) $(GENERATED_FILES)