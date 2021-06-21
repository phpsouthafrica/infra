#!/usr/bin/env bash
docker node update --label-add web01 web01
docker node update --label-add name=web01 web01
docker node update --label-add country=za web01
docker node update --label-add public=true web01
