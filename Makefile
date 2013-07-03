TITLE=epm-presentation
PDFDIR=pdf
BUILDDIR=build

all: slides

slides: pdfdir builddir
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

wbs.png: builddir
	dot -Tpng wbs.gv -o $(BUILDDIR)/wbs.png