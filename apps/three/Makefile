IMAGE_NAME = cluster-test/three

build:
	docker build -t $(IMAGE_NAME) .

run:
	mix phx.server

iex:
	iex -S mix phx.server

docker:
	docker run --rm -p 6000:6000 $(IMAGE_NAME)

docker-iex:
	docker run --rm -it -p 6000:6000 $(IMAGE_NAME) iex -S mix phx.server
