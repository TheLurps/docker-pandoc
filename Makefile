BIB_FILES := $(shell find . -iname "*.bib")
MD_FILES := $(wildcard *.md)

$(subst .md,-$(VERSION).pdf,$(MD_FILES)):
	pandoc $(subst -$(VERSION).pdf,.yml,$@) $(subst -$(VERSION).pdf,.md,$@) \
	--from markdown+yaml_metadata_block+footnotes+tex_math_dollars+implicit_figures+link_attributes \
	--to latex \
	--filter pandoc-fignos \
	--filter pandoc-citeproc \
	--bibliography $(BIB_FILES) \
	--output $@

all:  $(subst .md,-$(VERSION).pdf,$(MD_FILES))

default: all

clean:
	rm -v $(subst .md,-$(VERSION).pdf,$(MD_FILES))
