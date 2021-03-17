#!/bin/bash
drm() {
  export DOCKER_HOST=${DOCKER_HOST}
  for CONTAINER_ID in $(docker ps -q -a)
  do
    docker rm "${CONTAINER_ID}" &
  done
  for CONTAINER_ID in $(docker ps -f 'status=exited' -q)
  do
    docker rm "${CONTAINER_ID}" &
  done
  wait < <(jobs -p)
  echo "done"
}

drn() {
  export DOCKER_HOST=${DOCKER_HOST}
  for IMAGE_ID in $(docker images --filter dangling=true --quiet)
  do
    docker rmi "${IMAGE_ID}" &
  done

  for IMAGE_ID in $(docker images | grep -E '(production|staging)-20' | awk {'print $1":"$2'})
  do
    docker rmi "${IMAGE_ID}" &
  done
  wait < <(jobs -p)
  echo "done"
}

dspull() {
  for image in $(docker service ls --format='{{.Image }}' | sort | uniq)
  do
    docker pull "${image}" &
  done
  wait < <(jobs -p)
  echo "done"
}

dipull() {
  for image in $(docker images | awk {'print $1":"$2'} | grep -v 'REPOSITORY' | sort | uniq)
  do
    docker pull "${image}" &
    docker pull "$(echo ${image} | sed 's/\:.*/:latest/')" &
  done
  wait < <(jobs -p)
  echo "done"
}

dpull() {
  dipull
  dspull
}

dsupdate() {
  for SERVICE_ID in $(docker service ls -q)
  do
    docker service update "${SERVICE_ID}"
  done
  echo "done"
}
