require "kemal"
require "json"
require "soegen"
require "./query_engine"

get "/test" do |env|
  env.content_type = "application/json"

  query_engine = ElasticSearch::QueryEngine.new
  query_engine.fetch_data.to_json
end
