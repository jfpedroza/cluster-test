IMAGE_NAME = cluster-test/three

build:
	docker build -t $(REGISTRY_IP)/$(IMAGE_NAME) .

push:
	docker push $(REGISTRY_IP)/$(IMAGE_NAME)

run:
	elixir --name two@127.0.0.1 -S mix phx.server

iex:
	iex --name three@127.0.0.1 -S mix phx.server

docker:
	docker run --rm -p 6000:6000 $(IMAGE_NAME)

docker-iex:
	docker run --rm -it -p 6000:6000 $(IMAGE_NAME) iex -S mix phx.server
