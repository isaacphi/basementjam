# Based on https://tech.davis-hansson.com/p/make/

SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >


# Default
.PHONY: help
help:
> @echo "Basementjam"
> @echo ""

.PHONY: build
build:
> docker-compose build

.PHONY: start
start:
> docker-compose up -d

.PHONY: stop
stop:
> docker-compose down

.PHONY: restart
stop:
> docker-compose restart

