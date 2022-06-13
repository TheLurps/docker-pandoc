BIB_FILES := $(shell find . -iname "*.bib")
MD_FILES := $(wildcard *.md)

$(subst .md,-$(VERSION).pdf,$(MD_FILES)):
	@if [ -z $(TEMPLATE) ]; then\
		pandoc $(subst -$(VERSION).pdf,.yml,$@) $(subst -$(VERSION).pdf,.md,$@) \
		--defaults pandoc.yml \
		--bibliography $(BIB_FILES) \
		--output $@;\
	else\
		pandoc $(subst -$(VERSION).pdf,.yml,$@) $(subst -$(VERSION).pdf,.md,$@) \
		--defaults pandoc.yml \
		--bibliography $(BIB_FILES) \
		--template $(TEMPLATE) \
		--output $@;\
	fi

all:  $(subst .md,-$(VERSION).pdf,$(MD_FILES))

default: all

clean:
	-rm $(subst .md,-$(VERSION).pdf,$(MD_FILES))
