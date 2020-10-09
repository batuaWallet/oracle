SHELL=/bin/bash

root=$(shell cd "$(shell dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )
project=$(shell cat $(root)/package.json | grep '"name":' | head -n 1 | cut -d '"' -f 4 | tr '-' '_')

default:
start: start-chainlink

start-chainlink: start-ethprovider
	bash start-chainlink.sh

start-ethprovider:
	bash start-ethprovider.sh

stop:
	docker container stop ${project}_ethprovider || true
	docker container stop ${project}_chainlink || true
