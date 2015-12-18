# Create the INDEX foo and the TYPE bar
# curl -XPUT 'localhost:9200/foo?pretty'

# Index a document
# curl -XPUT 'localhost:9200/foo/bar/1?pretty' -d '
# {
#   "lang": "Crystal"
# }'


require "soegen"

class ElasticSearch::QueryEngine
  def initialize
    client = Soegen::Server.new # defaults to localhost:9200
    idx = client.index("foo")
    @type = idx.type("bar")
  end

  def fetch_data
    query = {
      query: {
        filtered: {
          query: {
            match_all: {} of String => String
          }
        }
      }
    }

    results = @type.search(query)
    return results.hits
  end
end
