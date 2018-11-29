
BOOKMD := book.mdpp
METADATA := metadata.yml
BUILDDIR := ./build
MARKDOWNPP_OUT := $(BUILDDIR)/mdpp.md
PP_OUT := $(BUILDDIR)/pp.md
OUTPUT := book

# All: includecode, reference, tableofcontents, latexrender, includeurl, youtubeembed, include
MARKDOWNPP_EXCLUDE := reference,tableofcontents,latexrender
PANDOC_OPTIONS := --number-sections --variable documentclass=book --highlight-style=code.theme

all: book

$(BUILDDIR):
	mkdir $(BUILDDIR)

markdownpp: $(BUILDDIR)
	markdown-pp $(BOOKMD) -e $(MARKDOWNPP_EXCLUDE) -o $(MARKDOWNPP_OUT)

pp: markdownpp
	pp $(MARKDOWNPP_OUT) > $(PP_OUT)

pdf-book: pp
	pandoc $(PANDOC_OPTIONS) latex/metadata.yml $(PP_OUT) -s -o $(OUTPUT).pdf

epub-book: pp
	pandoc $(PANDOC_OPTIONS) epub/metadata.yml $(PP_OUT) -s -o $(OUTPUT).epub

docker-book: pdf-book epub-book

book:
	sudo rm -rf $(BUILDDIR)
	docker run \
		--privileged \
		-v $(shell pwd):/book \
		quay.io/lpabon/makemdb \
			make OUTPUT=$(OUTPUT) docker-book
	sudo chown $(USER) $(OUTPUT).pdf
	sudo chown $(USER) $(OUTPUT).epub

clean:
	sudo rm -rf $(BUILDDIR)

.PHONY: clean all docker-book book pdf-book epub-book
