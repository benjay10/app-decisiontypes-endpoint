defmodule Dispatcher do
  use Matcher
  define_accept_types [
    html: [ "text/html", "application/xhtml+html" ],
    json: [ "application/json", "application/vnd.api+json" ]
  ]

  @any %{}
  @json %{ accept: %{ json: true } }
  @html %{ accept: %{ html: true } }

  # Forward all JSON requests on /api to the mu-cl-resource
  get "/api/*path", @json do
    Proxy.forward conn, path, "http://resources/"
  end

  # Forward all JSON requests on /sparql to the triplestore directly
  match "/sparql/*path", _ do
    Proxy.forward conn, [], "http://database:8890/sparql"
  end

  match "/*_", %{ last_call: true } do
    send_resp( conn, 404, "Route not found.  See config/dispatcher.ex" )
  end
end
