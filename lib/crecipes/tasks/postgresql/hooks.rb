begin
  Capistrano::Configuration.instance.load do
    if db_adapter == 'postgresql'
      after "deploy:install", "postgresql:install"
      after "deploy:setup", "postgresql:create_database"
    end
  end
rescue
end