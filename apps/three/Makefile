APP_NAME = three
IMAGE_NAME = cluster-test/three
REL_IMAGE_NAME = cluster-test/three-rel
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
	elixir --name $(APP_NAME)@127.0.0.1 -S mix phx.server

iex:
	iex --name $(APP_NAME)@127.0.0.1 -S mix phx.server

docker:
	docker run --rm -p 6000:6000 $(IMAGE_NAME)

docker-iex:
	docker run --rm -it -p 6000:6000 $(IMAGE_NAME) iex -S mix phx.server
