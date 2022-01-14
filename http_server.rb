require 'socket'
require_relative './countries/CH.rb'
class HttpServer

  def initialize(ip,port)
    @server = TCPServer.new port
    @status = 200
    @host = ip
  end 

  def start_http_server
    @ch = CH.new

    loop do
      session = @server.accept
      request = []
    
      while (line = session.gets) && (line.chomp.length > 0)
        request << line.chomp
      end
    
      if request[0] != nil
        http_method, path, protocol = request[0].split(' ') # Get path 
        parameters = extract_parameter(path)
        path = path.split('?')[0]
        if parameters == nil
          @status = 400
        else
          case path
          when "/lines"
            response_body = instance_variable_get("@#{parameters["country"].downcase}").lines
          when "/trains"
            response_body = instance_variable_get("@#{parameters["country"].downcase}").trains
          when "/schedules"
            response_body = instance_variable_get("@#{parameters["country"].downcase}").schedules
          when "/events"
            response_body = instance_variable_get("@#{parameters["country"].downcase}").events
          when "/trainsonlines"
            response_body = instance_variable_get("@#{parameters["country"].downcase}").trainsonlines
          when "/structure"
            response_body = instance_variable_get("@#{parameters["country"].downcase}").strucutre
          else
            @status = 404
          end
        end
      
      
        session.print "HTTP/1.1 " + @status.to_s + "\r\n" # 1
        session.print "Content-Type: text/html\r\n" # 2
        session.print "\r\n" # 3
        session.print "#{response_body}" #4
        
        session.close
      end
    end
  end


  def extract_parameter(url)
    if url.include? '?'
      parameter_string = url.split('?')[1]
      if parameter_string != nil
        parameters = parameter_string.split('&')
        array_parameters = {}
        for value in parameters do
          array_parameters[value.split('=')[0]] = value.split('=')[1]
        end
        return array_parameters
      end
    end
    return nil
  end

end
