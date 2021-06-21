#!/usr/bin/env bash
docker swarm init --advertise-addr $(dig +short web01.phpza.com | tail -n1)
