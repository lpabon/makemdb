
OUTPUT := out.pdf
MARKDOWN_PP_EXCLUDE := reference,tableofcontents,latexrender
# All: includecode, reference, tableofcontents, latexrender, includeurl, youtubeembed, include

all: book

./build:
	mkdir ./build

parse: ./build
	markdown-pp *.md -e $(MARKDOWN_PP_EXCLUDE) -o ./build/out.md

docker-book: parse
	pandoc --toc --variable documentclass=book ./build/out.md -o $(OUTPUT)

book:
	docker run \
		--privileged \
		-v $(shell pwd):/book \
		quay.io/lpabon/makemdb \
			make docker-book
	sudo chown $(USER) $(OUTPUT)

clean:
	rm -f $(OUTPUT)

.PHONY: clean all docker-book book
