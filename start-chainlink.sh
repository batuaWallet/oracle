#!/usr/bin/env bash
set -eu

# make sure a network for this project has been created
docker swarm init 2> /dev/null || true
docker network create --attachable --driver overlay $project 2> /dev/null || true

# documentation:
# https://docs.chain.link/docs/running-a-chainlink-node

data_dir="$HOME/.chainlink"

mkdir $data_dir

echo "ROOT=/chainlink
LOG_LEVEL=debug
ETH_CHAIN_ID=3
MIN_OUTGOING_CONFIRMATIONS=2
LINK_CONTRACT_ADDRESS=0x20fE562d797A42Dcb3399062AE9546cd06f63280
CHAINLINK_TLS_PORT=0
SECURE_COOKIES=false
GAS_UPDATER_ENABLED=true
ALLOW_ORIGINS=*" > $data_dir/.env

