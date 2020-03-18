# ElasticSearch 6.8.6 secured

Docker build files and other stuff for bitergia_elasticsearch.

The image that the files create contains an ElasticSearch OSS + SearchGuard plugin (Community edition) installed. Moreover there is a docker env variable that can be defined:

- `ANONYMOUS_USER`: If true, the anonymous user will be activated. If not defined or false, the anonymous user will be deactivated. Kibana/Kibiter with SearchGuard kibana-plugin must have activated the anonymous authentication (`ANONYMOUS_USER` if using [Kibiter](https://github.com/chaoss/grimoirelab-kibiter/tree/integration-6.8.6)).
