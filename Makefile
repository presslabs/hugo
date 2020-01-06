# Project Setup
PROJECT_NAME := hugo
PROJECT_REPO := github.com/presslabs/hugo

PLATFORMS = linux_amd64 darwin_amd64

DOCKER_REGISTRY ?= presslabs
IMAGES ?= hugo

include build/makelib/common.mk
include build/makelib/image.mk

VERSION := $(shell echo '$(VERSION)' | sed -E 's/\+presslabs//g')

GO111MODULE := on
GO_SUBDIRS := common/hugo
GO_PROJECT := github.com/gohugoio/hugo
GO_LINT_ARGS := --fast common/hugo
GO_STATIC_PACKAGES = $(GO_PROJECT)
GO_LDFLAGS += -X $(GO_PROJECT)/common/hugo.commitHash=$(COMMIT_HASH)+presslabs \
			  -X $(GO_PROJECT)/common/hugo.buildDate=$(BUILD_DATE)"

include build/makelib/golang.mk

