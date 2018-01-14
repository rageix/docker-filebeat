# docker-filebeat

A Dockerfile for creating [Filebeat](https://www.elastic.co/products/beats/filebeat) 6.x container 
using Debian Stretch slim.

It simply follows the [official installation procedure](https://www.elastic.co/guide/en/beats/filebeat/current/setup-repositories.html), which uses apt. 

Logs to STDOUT so easy to pull logs with `docker logs`.

You will find a reference Filebeat config file in `filebeat.reference.yml`.

This image expects the find the config file at `/etc/filebeat/filebeat.yml`.

## Build warnings

You will probably see the following warning:

`debconf: delaying package configuration, since apt-utils is not installed`

This will not affect anything. apt-utils is not an important package in a non-interactive 
installations such as Docker images.