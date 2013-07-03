TITLE=presentation
BUILDDIR=build

all: slides

graphics: build/wbs.png build/hire.png

slides: builddir graphics
	cd $(BUILDDIR) && \
		pdflatex ../$(TITLE).tex

builddir:
	mkdir -p $(BUILDDIR)

clean:
	-rm $(PDFDIR)/*.pdf
	-rm -r $(BUILDDIR)

$(BUILDDIR)/%.png: %.gv builddir
	dot -Tpng $< -o $@