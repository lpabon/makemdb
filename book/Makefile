
BOOKMD := book.mdpp
METADATA := metadata.yml
BUILDDIR := ./build
MARKDOWNPP_OUT := $(BUILDDIR)/mdpp.md
PP_OUT := $(BUILDDIR)/pp.md
OUTPUT := out.pdf

# All: includecode, reference, tableofcontents, latexrender, includeurl, youtubeembed, include
MARKDOWNPP_EXCLUDE := reference,tableofcontents,latexrender
PANDOC_EXTENSIONS := +pandoc_title_block

all: book

$(BUILDDIR):
	mkdir $(BUILDDIR)

markdownpp: $(BUILDDIR)
	markdown-pp $(BOOKMD) -e $(MARKDOWNPP_EXCLUDE) -o $(MARKDOWNPP_OUT)

pp: markdownpp
	pp $(MARKDOWNPP_OUT) > $(PP_OUT)

docker-book: pp
	pandoc --toc --variable documentclass=book $(METADATA) $(PP_OUT) -s -o $(OUTPUT)

book:
	sudo rm -rf $(BUILDDIR)
	docker run \
		--privileged \
		-v $(shell pwd):/book \
		quay.io/lpabon/makemdb \
			make docker-book
	sudo chown $(USER) $(OUTPUT)

clean:
	rm -f $(OUTPUT)

.PHONY: clean all docker-book book