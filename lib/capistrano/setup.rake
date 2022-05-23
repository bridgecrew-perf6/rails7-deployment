namespace :deploy do
    namespace :check do
      before :linked_files, :set_master_key do
        on roles(:app), in: :sequence, wait: 10 do
          unless test("[ -f #{shared_path}/config/credentials.yml.enc ]")
            upload! 'config/credentials.yml.enc', "#{shared_path}/config/credentials.yml.enc"
            upload! 'config/master.key', "#{shared_path}/config/master.key"
            upload! 'config/database.yml', "#{shared_path}/config/database.yml"
            upload! '.env', "#{shared_path}/.env"
          end
          unless test("[ -f #{shared_path}/config/master.key ]")
            upload! 'config/master.key', "#{shared_path}/config/master.key"
          end
          unless test("[ -f #{shared_path}/config/database.yml ]")
            upload! 'config/database.yml', "#{shared_path}/config/database.yml"
          end
          unless test("[ -f #{shared_path}/.env ]")
            upload! '.env', "#{shared_path}/.env"
          end
        end
      end
    end
  end