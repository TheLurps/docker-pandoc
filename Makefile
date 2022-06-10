BIB_FILES := $(shell find . -iname "*.bib")
MD_FILES := $(wildcard *.md)

$(subst .md,.pdf,$(MD_FILES)):
	pandoc $(subst .pdf,.yml,$@) $(subst .pdf,.md,$@) \
	--filter pandoc-citeproc \
	--bibliography $(BIB_FILES) \
	--output $@
