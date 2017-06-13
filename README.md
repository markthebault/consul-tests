# Consul on docker
This is a project to test consul capabilities, you can tweek the scripts to adjust to your needs.


Based on 3 docker-machine a consul services, registrator service and dnsmasq service will be started.

## Setup the cluster
`$ ./start-swarm.sh`

## Deploy consul services
`$ ./deploy-consul`

# Try it !
Get consul services `$ curl $(docker-machine ip swarm-1):8500/v1/catalog/services`
Test DNS service `$ dig @$(docker-machine ip swarm-1) consul.service.dc1.consul`
Registrator test:
```
$ docker $(docker-machine config swarm-1) run -d -P redis
$ curl $(docker-machine ip swarm-1):8500/v1/catalog/services

result:
{"consul":[],"redis":[]}
```
