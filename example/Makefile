
OUTPUT := out.pdf

all: book

docker-book:
	pandoc *.md -o $(OUTPUT)

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
