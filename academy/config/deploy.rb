 # Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

# Load RVM's capistrano plugin.    
require "rvm/capistrano"

set :rvm_ruby_string, '1.9.2'
set :rvm_type, :user  # Don't use system-wide RVM

default_run_options[:pty] = true

set :repository, "git@github.com:softwhisper/AecomoServices.git"  # Your clone URL
set :scm, :git
set :branch, "master"
set :rake, 'bundle exec rake'

task :staging do
  set :port, 1983
  set :user, "pablo"
  set :password, "f0rms0s0es"
  set :sudo, "sudo -p f0rm0s0es"  
  set :keep_releases, 5
  set :rails_env, "development"
  
  set :scm_passphrase, "advhwhpSoK9OaIAKKyJ1SjqXrEDDAmHRsEWjIDAnNxldljmezY"

  set :application, "aecomo.softwhisper.es"  
  set :deploy_to, "/var/www/rails/#{application}"

  role :app, "31.222.142.61"
  role :web, "31.222.142.61"
  role :db,  "31.222.142.61", :primary => true
end

task :production do
  set :port, 1983
  set :user, "pablo"
  set :sudo, "sudo -p f0rm0s0es"
  set :keep_releases, 5
  set :rails_env, "development"
  set :scm_passphrase, "advhwhpSoK9OaIAKKyJ1SjqXrEDDAmHRsEWjIDAnNxldljmezY"
  
  set :application, "strendersadmin.es"
  set :deploy_to, "/var/www/rails/#{application}"  
   
  role :app, "31.222.142.61"
  role :web, "31.222.142.61"
  role :db,  "31.222.142.61", :primary => true  
end


namespace :paperclip do 
  task :rm do
    run "rm -rf #{deploy_to}/current/config/initializers/paperclip.rb"
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end
end

namespace :logs do
  task :cat do
    run "cat #{deploy_to}/current/log/production.log"
  end
  task :tail do
    run "tail -f #{deploy_to}/current/log/production.log"
  end
end

namespace :db do
  desc 'Seeds dbs'
  task :seed, :roles => :db, :only => { :primary => true } do
    run "cd #{deploy_to}/current && rake db:seed RAILS_ENV=development" 
  end

  desc 'Dumps the production database to db/production_data.sql on the remote server'
  task :remote_dump, :roles => :db, :only => { :primary => true } do
    run "cd #{deploy_to}/current && " +
      "rake RAILS_ENV=production db:database_dump --trace" 
  end

  desc 'Downloads db/production_data.sql from the remote production environment to your local machine'
  task :remote_download, :roles => :db, :only => { :primary => true } do  
    execute_on_servers(options) do |servers|
      self.sessions[servers.first].sftp.connect do |tsftp|
        tsftp.download!("#{deploy_to}/current/db/production_data.sql", "db/production_data.sql")
      end
    end
  end

  desc 'Cleans up data dump file'
  task :remote_cleanup, :roles => :db, :only => { :primary => true } do
    execute_on_servers(options) do |servers|
      self.sessions[servers.first].sftp.connect do |tsftp|
        tsftp.remove! "#{deploy_to}/current/db/production_data.sql" 
      end
    end
  end

  desc 'Dumps, downloads and then cleans up the production data dump'
  task :remote_runner do
    remote_dump
    remote_download
    remote_cleanup
  end
end

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
   
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

namespace :status do
  desc "Displays memory usage"
  task :memory do
    mem = capture("free -m | grep Mem").squeeze(" ").split(" ")[1..-1]
    total, used, free, shared, buffers, cached = mem
    
    puts "\nMemory in (MBs)"
    puts "----------------------------"
    puts "Total: #{total}"
    puts "Used: #{used}"
    puts "Free: #{free}"
    puts "Shared: #{shared}"
    puts "Buffers: #{buffers}"
    puts "Cached: #{cached}"
    puts "----------------------------\n\n"
  end
end

namespace :system_folder do
  desc "Download System Folder"
  task :sync do
    get "#{shared_path}/system/", "tmp/", :recursive => true
  end  
  
  desc "Download CKEDITOR"
  task :cke do
    get "#{shared_path}/ckeditor_assets/", "tmp/", :recursive => true 
  end
end

after "deploy:update" do
  run "ln -nfs #{shared_path}/db/database.yml #{current_path}/config/database.yml"
  run "rm -rf  #{current_path}/public/ckeditor_assets"
  run "ln -nfs #{shared_path}/ckeditor_assets #{current_path}/public/ckeditor_assets"
end

before "deploy:symlink" do
  run "ln -nfs #{shared_path}/db/database.yml #{latest_release}/config/database.yml"
end

require 'bundler/capistrano'
#load 'deploy/assets'
