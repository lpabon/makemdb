FROM fedora
LABEL maintainer Luis Pabon <lpabon@gmail.com>

RUN dnf install -y make jre ImageMagick graphviz xz pandoc wget python python-pip texlive-scheme-full && \
    dnf clean all && \
	rm -rf /var/cache/dnf && \
	rm -rf /var/cache/yum && \
	wget https://cdsoft.fr/pp/pp-linux-x86_64.txz && \
	tar xJvf pp-linux-x86_64.txz && \
	mv pp /usr/bin/pp && \
	pip install MarkdownPP


