build:
	cd apps/one; make build
	cd apps/two; make build
	cd apps/three; make build

build-rel:
	cd apps/one; make build-rel
	cd apps/two; make build-rel
	cd apps/three; make build-rel

push:
	cd apps/one; make push
	cd apps/two; make push
	cd apps/three; make push

push-rel:
	cd apps/one; make push-rel
	cd apps/two; make push-rel
	cd apps/three; make push-rel

deps:
	cd apps/one; mix do deps.get, deps.compile
	cd apps/two; mix do deps.get, deps.compile
	cd apps/three; mix do deps.get, deps.compile
