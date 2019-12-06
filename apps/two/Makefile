APP_NAME = two
IMAGE_NAME = cluster-test/two
REL_IMAGE_NAME = cluster-test/two-rel
REL_DOCKERFILE = ../../Dockerfile.rel

build:
	docker build -t $(REGISTRY_IP)/$(IMAGE_NAME) .

build-rel:
	docker build -f $(REL_DOCKERFILE) --build-arg APP_NAME=$(APP_NAME) -t $(REGISTRY_IP)/$(REL_IMAGE_NAME) .

push:
	docker push $(REGISTRY_IP)/$(IMAGE_NAME)

push-rel:
	docker push $(REGISTRY_IP)/$(REL_IMAGE_NAME)

run:
	elixir --name $(APP_NAME)@127.0.0.1 -S mix run --no-halt

iex:
	iex --name $(APP_NAME)@127.0.0.1 -S mix

docker:
	docker run --rm $(IMAGE_NAME)

docker-iex:
	docker run --rm -it $(IMAGE_NAME) iex -S mix
