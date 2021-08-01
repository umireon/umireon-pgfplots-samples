.PHONY: all clean

all: gnuplot-cairolatex.pdf pgfplots-1.pdf pgfplots-2.pdf pgfplots-3.pdf pgfplots-snowman.pdf

gnuplot-cairolatex.pdf: gnuplot-cairolatex.tex gnuplot-cairolatex-inc.pdf
	lualatex --shell-escape $<

gnuplot-cairolatex.tex: gnuplot-cairolatex.gp
	gnuplot $<

pgfplots-%.pdf: pgfplots-%.tex
	lualatex --shell-escape $<

GENERATED_FILES := *.aux *.fdb_latexmk *.fls *.log *.pgf-plot.*
GENERATED_FILES += gnuplot-cairolatex.pdf gnuplot-cairolatex.tex gnuplot-cairolatex-inc.pdf
GENERATED_FILES += pgfplots-*.pdf

clean:
	$(RM) $(GENERATED_FILES)