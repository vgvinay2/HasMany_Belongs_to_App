worker_processes 2
working_directory "/home/vinay/Desktop/Example/modeldemo" # available in 0.94.0+
listen 4000, :tcp_nopush => true
timeout 120
pid "/home/vinay/Desktop/Example/modeldemo/tmp/pids/unicorn.pid"
preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

before_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.connection.disconnect!
end
after_fork do |server, worker|
    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.establish_connection
end

stderr_path "/home/vinay/Desktop/Example/modeldemo/log/unicorn_err.log"
stdout_path "/home/vinay/Desktop/Example/modeldemo/log/unicorn_out.log"

