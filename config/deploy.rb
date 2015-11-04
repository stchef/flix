load "deploy/assets"
set :application, "Movie"
set :repository,  "git@github.com:stchef/Movie.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :user, "Movie"
set :user_sudo, false
set :deploy_to, "/home/Movie/apps/Movie}"
set :keep_releases, 5
default_run_options[:shell] = '/bin/bash --login'

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run
role :db,  "localhost"
set :port, 2200

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
	path = File.join(current_path, 'tmp', 'restart.txt')
	run "#{try_sudo} touch #{path}"
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end
