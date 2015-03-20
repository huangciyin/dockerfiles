# ciyinhuang Elasticsearch

Elasticsearch in a docker container - for when you need a quick ES node for development.

## Single Node with Ephemeral Storage

```
docker pull ciyinhuang/ubuntu-elasticsearch:latest
docker run -d --name elasticsearch -p 9200:9200 ciyinhuang/ubuntu-elasticsearch
```

## Single node with Persistent Storage

```
docker pull ciyinhuang/ubuntu-elasticsearch:latest
docker run -d --name elasticsearch -p 9200:9200 -v /data/elasticsearch:/opt/elasticsearch/data ciyinhuang/ubuntu-elasticsearch
```

where `/data/elasticsearch` is where you want it to dump all the data files on your host.

## Cluster

Coming soon!
