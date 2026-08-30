# Docker Hub image
DOCKERHUB_USER ?= devalv
IMAGE_NAME ?= cover-sender
IMAGE_TAG ?= 0.1.2

IMAGE := $(DOCKERHUB_USER)/$(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: image-build
image-build:
	docker build \
		-f Dockerfile \
		-t $(IMAGE) \
		.

.PHONY: image-push
image-push:
	docker push $(IMAGE)

.PHONY: image-publish
image-publish: image-build image-push

.PHONY: run
run:
	docker run --rm \
		--user "$(id -u):$(id -g)" \
		-v "$(pwd):/app" \
		-w /app \
		devalv/cover-sender:0.1.2
