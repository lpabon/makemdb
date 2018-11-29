
BOOKMD := book.mdpp
METADATA := metadata.yml
BUILDDIR := ./build
MARKDOWNPP_OUT := $(BUILDDIR)/mdpp.md
PP_OUT := $(BUILDDIR)/pp.md
OUTPUT := book

# All: includecode, reference, tableofcontents, latexrender, includeurl, youtubeembed, include
MARKDOWNPP_EXCLUDE := reference,tableofcontents,latexrender
PANDOC_OPTIONS := --number-sections --variable documentclass=book --highlight-style=code.theme

# Images
dot_src := images/dot/sample.dot
uml_src := images/uml/sample.uml
ditaa_src := images/ditaa/sample.ditaa

all: book

dot_png := $(dot_src:.dot=.png)
dot_eps := $(dot_src:.dot=.eps)
uml_png := $(uml_src:.uml=.png)
uml_eps := $(uml_src:.uml=.eps)
ditaa_png := $(ditaa_src:.ditaa=.png)
ditaa_eps := $(ditaa_src:.ditaa=.eps)

%.png: %.dot
	dot -Tpng $^ -o $@

%.eps: %.dot
	dot -Teps $^ -o $@

%.png: %.uml
	plantuml -tpng $^

%.eps: %.uml
	plantuml -teps $^

%.png: %.ditaa
	ditaa $^

%.eps: %.ditaa
	java -jar /DitaaEps.jar $^ $@

$(BUILDDIR):
	mkdir $(BUILDDIR)

markdownpp: $(BUILDDIR)
	markdown-pp $(BOOKMD) -e $(MARKDOWNPP_EXCLUDE) -o $(MARKDOWNPP_OUT)

pp: markdownpp
	pp $(MARKDOWNPP_OUT) > $(PP_OUT)

pdf-book: pp $(dot_eps) $(uml_eps) $(ditaa_eps)
	pp -pdf $(MARKDOWNPP_OUT) > $(PP_OUT)
	pandoc $(PANDOC_OPTIONS) latex/metadata.yml $(PP_OUT) -s -o $(OUTPUT).tex
	pdflatex $(OUTPUT).tex

epub-book: pp $(dot_png) $(uml_png) $(ditaa_png)
	pp -epub $(MARKDOWNPP_OUT) > $(PP_OUT)
	pandoc $(PANDOC_OPTIONS) epub/metadata.yml $(PP_OUT) -s -o $(OUTPUT).epub

docker-book: pdf-book epub-book

book:
	sudo rm -rf $(BUILDDIR)
	docker run \
		--privileged \
		-v $(shell pwd):/book \
		quay.io/lpabon/makemdb:fedora29 \
			make OUTPUT=$(OUTPUT) docker-book
	sudo chown $(USER) $(OUTPUT).pdf
	sudo chown $(USER) $(OUTPUT).epub

clean:
	sudo rm -rf $(BUILDDIR)
	sudo rm -f $(dot_eps) $(dot_png) $(uml_eps) $(uml_png) $(ditaa_eps) $(ditaa_png)

.PHONY: clean all docker-book book pdf-book epub-book
