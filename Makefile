TALKS := $(sort $(dir $(filter-out node_modules/,$(wildcard */))))
TALKS_BUILD := $(subst /,/build,$(TALKS))

all: $(TALKS_BUILD)

node_modules: Makefile
	npm install remarker

%/build: %/slides.md %/presentation.css %/remarker.yml node_modules Makefile
	cd $*; ../node_modules/.bin/remarker build
	@touch $@

.PHONY: all
