TALKS := $(sort $(dir $(filter-out node_modules/,$(wildcard */))))
TALKS_BUILD := $(subst / ,/build ,$(TALKS))

all: $(TALKS_BUILD)
	echo $^

node_modules:
	npm install remarker

%/build: %/slides.md %/presentation.css %/remarker.yml node_modules
	cd $*; ../node_modules/.bin/remarker build
	@touch $@

.PHONY: all
