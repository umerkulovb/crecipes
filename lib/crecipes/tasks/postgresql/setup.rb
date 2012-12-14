begin
  Capistrano::Configuration.instance.load do
    namespace :postgresql do
      desc "Create a database for this application."
      task :create_database, roles: :db, only: {primary: true} do
        run %Q{#{sudo} -u postgres psql -c "create user #{db_user} with password '#{db_password}';"}
        run %Q{#{sudo} -u postgres psql -c "create database #{db_database} owner #{db_user};"}
      end
  
    end
  end
rescue 
end