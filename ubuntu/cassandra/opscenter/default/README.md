## OpsCenter Docker Image
This image contains OpsCenter and is based on ciyinhuang/ubuntu-python.
  
Run this using:

```
docker pull ciyinhuang/opscenter:latest
docker run -d --name opscenter ciyinhuang/opscenter:latest
```

You may also want to expose OpsCenter service ports:
```
docker run -d --name opscenter -p 8888:8888 -p 61620:61620 ciyinhuang/opscenter:latest
```

See https://github.com/ciyinhuang/cassandra for instructions on how to get a complete cluster running with OpsCenter in one line.
