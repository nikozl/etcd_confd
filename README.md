## Repo in progress

## Subject
This repository contains some info that can help us to run an etcd server and confd for automatically reload our configuration files. For example, we will work with conf
d for autoreload nginx.conf file getting data stored on our etcd server

## Get started

 Run etcd server
*  docker run  --rm -p 2379:2379   -p 2380:2380 --name etcd quay.io/coreos/etcd:latest   /usr/local/bin/etcd   --data-dir=/etcd-data --name node1 --advertise-client-urls http://0.0.0.0:2379 --listen-client-urls http://0.0.0.0:2379

 We have to build our confd docker image with nginx, so we have to go to confd dir and exec docker build -t confdnginx
*  Once the command has been finished, we can deploy our nginx + confd server.

docker run -d -p 80:80 confdnginx 

 Now we can insert key in our etcd server using curl:
*  curl http://127.0.0.1:2379/v2/keys/spa/niko -XPUT -d value="miaplicacion:5000"
 Or delete it:
*  curl http://127.0.0.1:2379/v2/keys/spa/miaplicacion:5000 -XDELETE

*  Run confd inside our confdnginx container, and we will see that the file nginx.conf has been updated. 
