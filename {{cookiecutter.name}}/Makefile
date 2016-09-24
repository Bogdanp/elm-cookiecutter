ELM_SOURCES = $(shell find elm -name "*.elm" -print)
CSS_SOURCES = $(shell find css -name "*.scss" -print)
JS_SOURCES = $(shell find js -name "*.js" -print)
JS_APP_T = build/js/app.js

OBJS = $(JS_APP_T)

SHELL := /bin/bash
PATH := node_modules/.bin:$(PATH)

# Tasks
# ~~~~~
# Phonies, big fat phonies.
.PHONY: all
all: $(OBJS)


.PHONY: help
help:
	@echo "usage: make [command]"
	@echo
	@echo "commands:"
	@echo "  all     build all assets"
	@echo "  serve   run a local development server"
	@echo "  watch   watch and recompile the js/elm assets"


.PHONY: serve
serve: $(OBJS)
	node bin/server.js


.PHONY: watch
watch: $(OBJS)
	webpack -w


# Targets
# ~~~~~~~
$(JS_APP_T): $(ELM_SOURCES) $(CSS_SOURCES) $(JS_SOURCES)
	webpack
