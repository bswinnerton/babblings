worker_processes Integer(ENV["WEB_CONCURRENCY"] || 2)
timeout 30
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
  ::Oboe.disconnect! if defined?(::Oboe)


  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  ::Oboe.reconnect!  if defined?(::Oboe)

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
