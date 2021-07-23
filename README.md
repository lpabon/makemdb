# makemdb

`makemdb` is a suite of tools managed by a single Makefile to create a PDF and ePub
from the same markdown content. It is based on the following tools:

* MarkdownPP: https://github.com/jreese/markdown-pp
* PP: http://christophe.delord.free.fr/pp/
* Pandoc: https://pandoc.org

Latex style based on:

* http://www.LaTeXTemplates.com by Mathias Legrand and Vel

Based on the following blog:

* Thorsten Ball: https://thorstenball.com/blog/2018/09/04/the-tools-i-use-to-write-books/

## Why I created it

I wanted a way to create a pdf and have the ePub version be very similar
to it. For that reason, PP is used as macros to manage high quality images
in PDF and the correct representation in HTML of mini-sections(like Remark).

A lot of the text is taken from the [Rust book](https://github.com/rust-lang/book) just
as an example of what it would look like.
