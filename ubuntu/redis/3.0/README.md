# DevDB Redis

Redis in a docker container - for when you need a quick Redis deployment.

## Single Node with Ephemeral Storage

```
docker pull ciyinhuang/redis:latest
docker run -d --name redis -p 6379:6379 ciyinhuang/redis:latest
```

## Single Node with Persistent Storage

```
docker pull ciyinhuang/redis:latest
docker run -d --name redis -p 6379:6379 -v /data/redis:/var/lib/redis ciyinhuang/redis:latest
```

where `/data/redis` is where you want it to dump all the data files on your host.

## Cluster

Coming soon!
