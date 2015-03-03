worker_processes 2
working_directory "/var/www/model_demo/current"
listen 4000, :tcp_nopush => true
timeout 120
pid "/var/www/model_demo/current/tmp/pids/unicorn.pid"
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

stderr_path "/var/www/model_demo/current/log/unicorn_err.log"
stdout_path "/var/www/model_demo/current/log/unicorn_out.log"
