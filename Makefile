default: build

build-%:
	cd apps/$*; make build

build: build-one build-two build-three

push-%:
	cd apps/$*; make push

push: push-one push-two push-three

deps-%:
	cd apps/$*; mix do deps.get, deps.compile

deps: deps-one deps-two deps-three
