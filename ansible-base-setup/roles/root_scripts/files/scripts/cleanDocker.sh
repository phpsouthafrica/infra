#!/usr/bin/env bash
for CONTAINER_ID in $(docker ps -q -a)
do
  docker rm "$CONTAINER_ID"
done

for CONTAINER_ID in $(docker ps -f 'status=exited' -q)
do
  docker rm "$CONTAINER_ID"
done

for IMAGE_ID in $(docker images --filter dangling=true --quiet)
do
  docker rmi "$IMAGE_ID"
done

for IMAGE_ID in $(docker images | grep -E '(production|staging)-20' | awk {'print $1":"$2'})
do
  docker rmi "$IMAGE_ID"
done
