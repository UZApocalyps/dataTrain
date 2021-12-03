require 'socket'
require_relative 'api.rb'
class HttpServer

  def initialize(ip,port)
    @server = TCPServer.new port
    @status = 200
    @host = ip
  end

  def start_http_server
    loop do
      session = @server.accept
      request = []
    
      while (line = session.gets) && (line.chomp.length > 0)
        request << line.chomp
      end
    
      http_method, path, protocol = request[0].split(' ') # Get path 
    
      case path
      when "/trains"
        response_body = Api.get("","")
      when "/schedules"
        response_body = ""
      else
        status = 404
      end
    
    
      session.print "HTTP/1.1 #{status}\r\n" # 1
      session.print "Content-Type: text/html\r\n" # 2
      session.print "\r\n" # 3
      session.print "#{response_body}" #4
      
      session.close
    end
  end
end
