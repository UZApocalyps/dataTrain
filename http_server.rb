require 'socket'
server = TCPServer.new 5678
def bite
    puts "couille"
end

status = 200

loop do
  session = server.accept
  request = []

  while (line = session.gets) && (line.chomp.length > 0)
    request << line.chomp
  end

  http_method, path, protocol = request[0].split(' ') # Get path 

  case path
  when "/trains"
    response_body = ""
  when "/schedules"
    response_body = ""
  else
    status = 404
  end


  session.puts <<-HEREDOC
HTTP/1.1 #{status}

#{response_body}
  HEREDOC

  session.close
end

