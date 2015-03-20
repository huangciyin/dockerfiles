# ciyinhuang Elasticsearch + Kibana

Elasticsearch Kibana in a docker container for a fast throwaway environment.

# Quickstart

Use this if you don't care about Elasticsearch data persisting across container destroy/restart/etc.

```
docker pull ciyinhuang/kibana:latest
docker run -d --name kibana -p 5601:5601 -p 9200:9200 ciyinhuang/kibana
```

You can create an index and mappings using:

```
curl -XPUT http://localhost:9200/twitter
curl -XPUT http://localhost:9200/twitter/_mapping/tweet -d '{
   "tweet" : {
     "properties": {
         "text": { "type": "string" },
         "user_id": { "type": "string", "index": "not_analyzed" }
     }
   }
}'
```

Then, you can point your browser to `http://localhost:5601` and the Kibana4 dashboard will come up.

**Warning**: The data in Elasticsearch is lost when the container is destroyed. If you want the data to persist, then use:

```
docker pull ciyinhuang/kibana:latest
docker run -d --name kibana -p 5601:5601 -v /data/kibana:/opt/elasticsearch/data ciyinhuang/kibana
```

where `/data/kibana` is where the data files are stored on your host machine.
