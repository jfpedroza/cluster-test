IMAGE_NAME = cluster-test/one

build:
	docker build -t $(IMAGE_NAME) .

run:
	elixir --name one@127.0.0.1 -S mix run --no-halt

iex:
	iex --name one@127.0.0.1 -S mix

docker:
	docker run --rm $(IMAGE_NAME)

docker-iex:
	docker run --rm -it $(IMAGE_NAME) iex -S mix
