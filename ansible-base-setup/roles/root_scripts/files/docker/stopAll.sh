#!/usr/bin/env bash
docker stack rm $(docker stack ls | awk '{print $1}')
