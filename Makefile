build:
	cd apps/one; make build
	cd apps/two; make build
	cd apps/three; make build

deps:
	cd apps/one; mix do deps.get, deps.compile
	cd apps/two; mix do deps.get, deps.compile
	cd apps/three; mix do deps.get, deps.compile
