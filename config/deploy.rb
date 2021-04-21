lock '~> 3.16.0'

set :application, 'rekishichizu'

set :repo_url,  'git@github.com:hokke-jp/rekishichizu.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.7.2'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/rekisitizu_key_rsa']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

set :unicorn_config_path, -> { "#{current_path}/config/unicorn.conf.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

# namespace :deploy do
#   desc 'Restart application'
#   task :restart do
#     invoke 'unicorn:restart'
#   end

#   desc 'Create database'
#   task :db_create do
#     on roles(:db) do |host|
#       with rails_env: fetch(:rails_env) do
#         within current_path do
#           execute :bundle, :exec, :rake, 'db:create'
#         end
#       end
#     end
#   end

#   desc 'Run seed'
#   task :seed do
#     on roles(:app) do
#       with rails_env: fetch(:rails_env) do
#         within current_path do
#           execute :bundle, :exec, :rake, 'db:seed'
#         end
#       end
#     end
#   end

#   after :publishing, :restart

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#     end
#   end
# end
