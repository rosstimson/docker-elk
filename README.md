Simple ELK with Docker
======================

## Deploy

```
$ docker-compose build
$ docker-compose up
```

**Note:** Logstash is setup with `stdin` as it's input.  In order for this to work and
it not exit straight away the it has `stdin_open: true` and `tty: true` set in 
the `docker-compose.yml`.  However this doesn't seem to allow you to just start typing stuff
to be logged as I expected.  In order to get some test data into ElasticSearch to try Kibana
out properly you can do the following:

```
$ docker run -ti --link elk_elasticsearch_1:elasticsearch rosstimson/logstash bash
```

Then within the Docker container:

```
root@docker-container:/logstash# logstash -f logstash.conf
Hello ELK
{
      "message" => "And another",
      "@version" => "1",
      "@timestamp" => "2015-03-05T23:05:18.354Z",
      "host" => "49329215762b"
}
```

Once there is some test data in the linked Elasticsearch you can complete the initial
setup of Kibana.
