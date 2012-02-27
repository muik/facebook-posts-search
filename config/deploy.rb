$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
set :application, "facebook-posts-search"
set :repository,  "git@github.com:muik/facebook-posts-search.git"
set :deploy_to, "/home/muik/deploy/#{application}"
set :rails_env, "production"
set :use_sudo, false
set :rvm_type, :user

set :scm, :git

role :web, "muik.net"                          # Your HTTP server, Apache/etc
role :app, "muik.net"                          # This may be the same as your `Web` server
role :db,  "muik.net", :primary => true # This is where Rails migrations will run

require "rvm/capistrano"
require "bundler/capistrano"
require 'capistrano-unicorn'

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
