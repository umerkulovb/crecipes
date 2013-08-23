begin
  Capistrano::Configuration.instance.load do
    namespace :db do
      task :setup, roles: :app do
        run "mkdir -p #{shared_path}/config"
        chelpers.move_template "db/database.yml.erb","#{shared_path}/config/database.yml"
      end

      desc "Symlink the database.yml file into latest release"
      task :symlink, roles: :app do
        run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      end

      desc "Loads database schema"
      task :load_schema, roles: :db do
        run "cd #{current_path} && RAILS_ENV=#{rail_env} bundle exec rake db:schema:load"
      end

      desc "Loads database seed"
      task :seed, roles: :db do
        run "cd #{current_path} && RAILS_ENV=#{rail_env} bundle exec rake db:seed"
      end
    end
  end
rescue
end