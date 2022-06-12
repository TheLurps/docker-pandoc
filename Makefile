BIB_FILES := $(shell find . -iname "*.bib")
MD_FILES := $(wildcard *.md)

$(subst .md,-$(VERSION).pdf,$(MD_FILES)):
	pandoc $(subst -$(VERSION).pdf,.yml,$@) $(subst -$(VERSION).pdf,.md,$@) \
	--defaults pandoc.yml \
	--bibliography $(BIB_FILES) \
	--output $@

all:  $(subst .md,-$(VERSION).pdf,$(MD_FILES))

default: all

clean:
	-rm $(subst .md,-$(VERSION).pdf,$(MD_FILES))
