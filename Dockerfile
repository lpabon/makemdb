FROM fedora:33
LABEL maintainer Luis Pabon <lpabon@gmail.com>

RUN dnf install -y \
		make jre ImageMagick graphviz \
		xz pandoc wget python python-pip \
		texlive-scheme-full ditaa plantuml && \
    dnf clean all && \
	rm -rf /var/cache/dnf && \
	rm -rf /var/cache/yum && \
	wget http://cdelord.fr/pp/pp-linux-x86_64.txz && \
	tar xJvf pp-linux-x86_64.txz && \
	mv pp /usr/bin/pp && \
	pip install MarkdownPP

RUN wget http://downloads.sourceforge.net/ditaa-addons/DitaaEps-0_2.zip && \
    unzip DitaaEps-0_2.zip && \
	mv DitaaEps/*.jar /
RUN mkdir /book
WORKDIR /book
