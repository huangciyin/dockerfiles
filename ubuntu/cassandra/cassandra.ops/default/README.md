Cassandra as a Docker container. For development use only.  

## Quickstart

### TL;DR

  
```
#!/bin/bash
docker pull ciyinhuang/ubuntu-opscenter:latest
docker pull ciyinhuang/ubuntu-cassandra.ops:latest
echo "Starting OpsCenter"
docker run -d --name opscenter ciyinhuang/ubuntu-opscenter:latest
sleep 10
OPS_IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' opscenter)
echo "Starting node cass1"
docker run -d --name cass1 -P -e OPS_IP=$OPS_IP ciyinhuang/ubuntu-cassandra.ops:latest
sleep 30
SEED_IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' cass1)
for name in cass{2..5}; do
  echo "Starting node $name"
  docker run -d --name $name -e SEED=$SEED_IP -e OPS_IP=$OPS_IP -P ciyinhuang/ubuntu-cassandra.ops:latest
  sleep 30
done
echo "Registering cluster with OpsCenter"
curl \
  http://$OPS_IP:8888/cluster-configs \
  -X POST \
  -d \
  "{
      \"cassandra\": {
        \"seed_hosts\": \"$SEED_IP\"
      },
      \"cassandra_metrics\": {},
      \"jmx\": {
        \"port\": \"7199\"
      }
  }" > /dev/null
echo "Go to http://$OPS_IP:8888/"
```

## Manual Mode

### OpsCenter
Skip this section if you don't want to run OpsCenter.

Pull the image and launch OpsCenter.  
  
```
docker pull ciyinhuang/ubuntu-cassandra.ops:latest
docker run -d --name opscenter ciyinhuang/ubuntu-opscenter:latest
```

Grab the OpsCenter IP:

```
OPS_IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' opscenter)
```

### Single Node
Pull the image.  
  
```
docker pull ciyinhuang/ubuntu-cassandra.ops:latest
```
  
Launch the node  
  
  - without OpsCenter:  
  
```
docker run -d --name cass1 ciyinhuang/ubuntu-cassandra.ops:latest
```
  
  - with OpsCenter:  
  
```
docker run -d --name cass1 -e OPS_IP=$OPS_IP ciyinhuang/ubuntu-cassandra.ops:latest
```
  
Grab the seed node's IP using:  
  
```
SEED_IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' cass1)
```
  
Connect to it using CQLSH:  
  
```
cqlsh $SEED_IP
```
  
### Multiple Nodes
  
Follow the single node setup to get the first node running and keep track of its IP. Run the following to launch the other nodes in the cluster:  
  - without OpsCenter:  
  
```
for name in cass{2..5}; do
  echo "Starting node $name"
  docker run -d --name $name -e SEED=$SEED_IP ciyinhuang/ubuntu-cassandra.ops:latest
  sleep 30
done
```
  
  - with OpsCenter:  
  
```
for name in cass{2..5}; do
  echo "Starting node $name"
  docker run -d --name $name -e SEED=$SEED_IP -e OPS_IP=$OPS_IP ciyinhuang/ubuntu-cassandra.ops:latest
  sleep 30
done
```
  
Once all the nodes are up, check cluster status using:  
  
```
nodetool --host $SEED_IP status
```
  
or, if you installed OpsCenter, go to `http://$OPS_IP:8888` and choose the "Add Existing Cluster option".
