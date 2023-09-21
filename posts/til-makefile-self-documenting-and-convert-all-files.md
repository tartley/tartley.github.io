<!--
.. title: TIL: Makefiles that are self-documenting, and process all extant files.
.. slug: makefiles-that-are-self-documenting-and-process-all-extant-files
.. date: 2023-07-06 11:50:16 UTC-05:00
.. tags: geek,til,make,terminal
-->

## Self-documenting Makefiles

A trick from years ago, but I copy it around between projects enough that it
deserves calling out. Add a target:

```Makefile
help: ## Show this help.
	@# Optionally add 'sort' before 'awk'
	@grep -E '^[a-zA-Z_\.%-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'
.PHONY: help
```

Decorate other targets with a descriptive '##' comment, like "*Show this help*"
above. Now calling the 'help' target will summarize all the things the Makefile
can do. eg:

```text
$ make help
help       Show this help.
setup      Install required system packages using 'apt install'.
%.pdf      Generate given PDF from corresponding .tex file.
all        Convert all .tex files to PDF.
```

You might choose to make 'help' the first target in the Makefile, so that it
gets triggered when the user runs `make` without arguments.

## Process all extant files

Make's canonical paradigm is that you tell it the name of the file to generate,
and it uses the tree of dependencies specified in the Makefile to figure out
how to build it. Typically you'll use automatic variables like "$<" to represent
the wildcarded source filename:

```Makefile
%.pdf: %.tex ## Generate given PDF from corresponding .tex file.
	pdflatex $<
```

The pitfall is that when invoking this, you have to name all the PDF files you
want to generate. If the names are a fixed part of your build, they can be
embedded in the Makefile itself:

```Makefile
all: one.pdf two.pdf three.pdf
```

But if their names are dynamic, you have to specify them on the command line,
which is a pain:

```Bash
$ make one.pdf two.pdf three.pdf
```

This is easy enough when *re-*generating all the PDFs that already exist:

```Bash
$ make *.pdf
```

but is no help when you just have a bunch of .tex files and you just want Make
to build all of them. This is going the opposite way to canonical make usage.
We want to specify the existing source files (`*.tex`, in this case), and have
Make build the resulting products.

To do it, we need our Makefile to enumerate the existing source files:

```Makefile
TEX_FILES = $(wildcard *.tex)
```

Using the 'wildcard' function here behaves better than a bare wildcard
expansion, e.g. it produces no output when there are no matches, rather than
outputting the unmatched wildcard expression.

Then use a substitution to generate the list of .pdf filenames:

```Makefile
all = $(TEX_FILES:%.tex=%.pdf)
```

Now `make all` will generate one .pdf file for each extant .tex file, regardless of
whether the corresponding .pdf files already exist or not.

