# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'my_app_name'
set :repo_url, 'git@github.com:puhsh/realtors.git'
set :deploy_to, '/var/www/www.realtors.social'
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :keep_releases, 5
set :rvm_type, :auto
set :rvm_ruby_version, 'rvm current'

namespace :deploy do
end
