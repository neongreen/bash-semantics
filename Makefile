.PHONY: docker-build docker-bash serve build
.SILENT: docker-bash serve build

docker-build:
	docker build .

docker-bash:
	docker run --rm -t -i -v ${PWD}:/book $$(docker build -q .) bash

# --init is needed to allow Ctrl+C to work
serve:
	echo "========================================" ;\
	echo "=== Serving on http://localhost:6400 ===" ;\
	echo "========================================" ;\
	docker run --rm -t -i --init -p 6400:6400 -v ${PWD}:/book $$(docker build -q .) "mdbook serve --hostname 0.0.0.0 --port 6400"

build:
	docker run --rm -v ${PWD}:/book $$(docker build -q .) "mdbook build"
