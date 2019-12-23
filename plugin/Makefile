PANDOC := $(shell which pandoc)
FILTER_INCLUDE := $(shell which pandoc-include-code)
PDF_ENGINE ?= 'lualatex'
PDF_VIEWER := $(shell which zathura)
outfile ?= $(shell mktemp).pdf

pdf: $(markdown_file) $(FILTER_INCLUDE) $(PANDOC)
	$(PANDOC) -f markdown -o $(outfile) -t latex $(markdown_file) -F $(FILTER_INCLUDE) --pdf-engine $(PDF_ENGINE)

view: $(outfile)
	$(PDF_VIEWER) $(outfile) &
