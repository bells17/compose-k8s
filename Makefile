SHELL := /bin/bash
KUBECONFIG := $(shell pwd)/tmp/config

.PHONY: setup
setup:
	docker compose up -d --wait
	sed -i 's|https://127.0.0.1:6443|https://server:6443|' tmp/kubeconfig.yaml

.PHONY: clean
clean:
	docker compose down --volumes
	rm -f tmp/config

.PHONY: example
example:
	docker compose exec -it kubectl kubectl get node
