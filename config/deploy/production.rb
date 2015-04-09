server '52.5.240.228', user: 'realtors', roles: %w{app db}, my_property: :my_value

set :application, 'bookloads'
set :deploy_to, "/var/www/books.bookshout.com"
set :stage, :production
set :rails_env, 'production'
set :unicorn_pid, -> { File.join(current_path, "tmp", "pids", "unicorn.realtors.pid") }
set :unicorn_rack_env, 'production'
