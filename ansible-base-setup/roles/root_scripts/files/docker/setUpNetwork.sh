#!/usr/bin/env bash
docker network create --opt encrypted -d overlay --subnet=10.10.1.0/24 --attachable traefik-net
docker network create --opt encrypted -d overlay --subnet=10.10.2.0/24 --attachable server-net
