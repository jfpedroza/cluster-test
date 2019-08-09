IMAGE_NAME = cluster-test/two

build:
	docker build -t $(IMAGE_NAME) .

run:
	mix run --no-halt

iex:
	iex -S mix

docker:
	docker run --rm $(IMAGE_NAME)

docker-iex:
	docker run --rm -it $(IMAGE_NAME) iex -S mix
