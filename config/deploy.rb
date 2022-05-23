lock "~> 3.17.0"

server '54.196.144.86', port: 22, roles: [:web, :app, :db], primary: true

set :assets_roles,    [:web, :app, :db]            # Defaults to [:web]
set :repo_url,        'git@github.com:purevdalai/rails7-deployment.git'
set :application,     'deployment'
set :branch,          'master'
set :user,            'ubuntu'

set :rvm_type,          :user
set :rvm_bin_path,      "$HOME/bin"
set :rvm_ruby_version,  '3.1.0'
set :passenger_in_gemfile, true
set :passenger_rvm_ruby_version, fetch(:rvm_ruby_version)
set :passenger_restart_with_touch, true
set :default_env, { 'passenger_instance_registry_dir' => '/home/ubuntu/passenger_temp' }

set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

# /home/ubuntu/apps/deployment/current/public

set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/keypair.pem) }

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/credentials.yml.enc', 'config/master.key', '.env')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'tmp/images', 'vendor/bundle', 'public/system', 'public/uploads')