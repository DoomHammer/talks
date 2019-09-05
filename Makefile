TALKS := $(sort $(dir $(filter-out node_modules/,$(wildcard */))))
TALKS_BUILD := $(subst /,/index.html,$(TALKS))

all: $(TALKS_BUILD)

node_modules: Makefile
	npm install remarker

%/index.html: %/slides.md %/presentation.css %/remarker.yml node_modules Makefile
	cd $*; ../node_modules/.bin/remarker build -d .
	@touch $@

.PHONY: all
