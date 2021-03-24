#!/usr/bin/env bash
docker swarm init --advertise-addr $(dig +short web01.phpsouthafrica.org | tail -n1)
