begin
  Capistrano::Configuration.instance.load do
    namespace :postgresql do
      task :setup, roles: :app do
        run "mkdir -p #{shared_path}/config"
        helpers.move_template("db/postgresql.yml.erb","#{shared_path}/config/database.yml")
      end
    end
  end
rescue 
end