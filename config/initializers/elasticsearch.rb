require 'elasticsearch/model'

Elasticsearch::Model.client = Elasticsearch::Client.new(
  hosts: ENV['PLM_ES_HOSTS'],
  retry_on_failure: false,
  request_timeout: 20,
  log: false,
)
