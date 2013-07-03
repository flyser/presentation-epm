TITLE=presentation
PDFDIR=pdf
BUILDDIR=build

all: slides

graphics: build/wbs.png build/hire.png

slides: pdfdir builddir graphics
	cd $(BUILDDIR) && \
		pdflatex ../$(TITLE).tex -output-directory ../$(PDFDIR)
	mv $(BUILDDIR)/$(TITLE).pdf $(PDFDIR)

pdfdir:
	mkdir -p $(PDFDIR)

builddir:
	mkdir -p $(BUILDDIR)

clean:
	-rm $(PDFDIR)/*.pdf
	-rm -r $(BUILDDIR)

$(BUILDDIR)/%.png: %.gv builddir
	dot -Tpng $< -o $@