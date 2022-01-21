require_relative "http_server.rb"
puts("hello")
http_server = HttpServer.new("localhost","8000")
http_server.start_http_server()