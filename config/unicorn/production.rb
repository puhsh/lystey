# Set your full path to application.
app_path = '/var/www/www.lystey.com/current'

# Set unicorn options
worker_processes 2
preload_app true
timeout 30
listen "#{app_path}/tmp/sockets/unicorn.lystey.sock", :backlog => 1024

# Fill path to your app
working_directory app_path

rails_env = 'production'

# Log everything to one file
stderr_path 'log/unicorn.log'
stdout_path 'log/unicorn.log'

# Set master PID location
pid "#{app_path}/tmp/pids/unicorn.lystey.pid"

before_fork do |server, worker|
  ENV['BUNDLE_GEMFILE'] = "#{app_path}/Gemfile"
  defined?(ActiveRecord::Base) and
  ActiveRecord::Base.connection.disconnect!

  old_pid = "#{app_path}/tmp/pids/unicorn.lystey.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      server.logger.info("worker=#{worker.nr} sending QUIT to #{old_pid}")
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      server.logger.info("#{old_pid} already removed")
    end
  end

  sleep 1
end
