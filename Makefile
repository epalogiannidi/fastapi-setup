## MAKEFILE

.PHONY: help
help:
	@echo "	black			: formats code using black, the Python code formatter"
	@echo "	lint			: checks source code with flake8"
	@echo "	mypy			: checks static typing with mypy"
	@echo "	isort			: sorts the imports"
	@echo "	docker-build	: build the docker image"
	@echo "	docker-run	    : run the docker image as a container"

.PHONY: black
black:
	black fastapi_setup/

.PHONY: lint
lint:
	flake8 --max-line-length 120 --ignore E203,E402,W503 fastapi_setup/

.PHONY: isort
isort:
	isort fastapi_setup/

.PHONY: mypy
mypy:
	mypy --config-file configs/mypy.ini fastapi_setup/
	rm -rf .mypy_cache

.PHONY: docker-build
docker-build:
	docker build -t fastapi-setup .

.PHONY: docker-run
docker-run:
	docker run -i -t -p 8000:8000 fastapi-setup
