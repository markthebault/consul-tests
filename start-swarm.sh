#!/bin/bash
source variables.cfg



for i in $(seq 1 $NODES); do
    docker-machine create -d virtualbox --engine-opt experimental swarm-$i
done

eval $(docker-machine env swarm-1)

docker swarm init --advertise-addr $(docker-machine ip swarm-1)

TOKEN=$(docker swarm join-token -q manager)

for i in $(seq 2 $NODES); do
  eval $(docker-machine env swarm-$i)
  docker swarm join --token $TOKEN --advertise-addr $(docker-machine ip swarm-$i) $(docker-machine ip swarm-1):2377
done
