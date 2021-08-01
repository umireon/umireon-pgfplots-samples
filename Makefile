.PHONY: all clean

all: gnuplot-cairolatex.pdf

gnuplot-cairolatex.pdf: gnuplot-cairolatex.tex gnuplot-cairolatex-inc.pdf
	lualatex $<

gnuplot-cairolatex.tex: gnuplot-cairolatex.gp
	gnuplot $<

GENERATED_FILES := *.aux *.fdb_latexmk *.fls *.log
GENERATED_FILES += gnuplot-cairolatex.pdf gnuplot-cairolatex.tex gnuplot-cairolatex-inc.pdf

clean:
	$(RM) $(GENERATED_FILES)