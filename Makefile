SNAME ?= tf-opencv
NAME ?= elswork/$(SNAME)
VER ?= `cat VERSION`-`cat VERSIONOCV`
BASE ?= tensorflow-diy
BASENAME ?= elswork/$(BASE)
ARCH2 ?= armv7l
GOARCH := $(shell uname -m)
ifeq ($(GOARCH),x86_64)
	GOARCH := amd64
endif

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS
# Build the container

debug: ## Build the container
	docker build -t $(NAME):$(GOARCH) \
	--build-arg BASEIMAGE=$(BASENAME):$(GOARCH)_`cat VERSION` \
	--build-arg VERSION=$(SNAME)_$(GOARCH)_$(VER) .
build: ## Build the container
	docker build --no-cache -t $(NAME):$(GOARCH) --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	--build-arg VCS_REF=`git rev-parse --short HEAD` \
	--build-arg BASEIMAGE=$(BASENAME):$(GOARCH)_`cat VERSION` \
	--build-arg VERSION=$(SNAME)_$(GOARCH)_$(VER) . > ../builds/$(SNAME)_$(GOARCH)_$(VER)_`date +"%Y%m%d_%H%M%S"`.txt
tag: ## Tag the container
	docker tag $(NAME):$(GOARCH) $(NAME):$(GOARCH)_$(VER)
push: ## Push the container
	docker push $(NAME):$(GOARCH)_$(VER)
	docker push $(NAME):$(GOARCH)	
deploy: build tag push
manifest: ## Create an push manifest
	docker manifest create $(NAME):$(VER) $(NAME):$(GOARCH)_$(VER) $(NAME):$(ARCH2)_$(VER)
	docker manifest push --purge $(NAME):$(VER)
	docker manifest create $(NAME):latest $(NAME):$(GOARCH) $(NAME):$(ARCH2)
	docker manifest push --purge $(NAME):latest
start: ## Start the container
	docker run -it $(NAME):$(GOARCH)
test: 
	docker run -it --rm $(NAME):$(GOARCH) \
	python3 -c "import tensorflow as tf; tf.enable_eager_execution(); print(tf.reduce_sum(tf.random_normal([1000, 1000])))"
test2: 
	docker run -it --rm $(NAME):$(GOARCH) \
	python3 -c "import tensorflow as tf; print(tf.__version__)"
test3: 
	docker run -it --rm $(NAME):$(GOARCH) \
	python3 -c "import cv2; cv2.__version__"
