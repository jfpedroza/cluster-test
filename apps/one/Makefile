APP_NAME = one
IMAGE_NAME = cluster-test/one
DOCKERFILE = ../../Dockerfile.rel

build:
	docker build -f $(DOCKERFILE) --build-arg APP_NAME=$(APP_NAME) -t $(IMAGE_NAME) .

tag:
	docker tag $(IMAGE_NAME) $(REGISTRY_IP)/$(IMAGE_NAME)

push: tag
	docker push $(REGISTRY_IP)/$(IMAGE_NAME)

run:
	elixir --name $(APP_NAME)@127.0.0.1 -S mix run --no-halt

iex:
	iex --name $(APP_NAME)@127.0.0.1 -S mix
