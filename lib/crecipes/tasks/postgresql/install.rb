begin
  Capistrano::Configuration.instance.load do
    namespace :postgresql do
      desc "Install the latest stable release of PostgreSQL."
      task :install, roles: :db, only: {primary: true} do
        helpers.apt_add_repo "pitti/postgresql"
        helpers.apt_install "postgresql libpq-dev"
      end
    end
  end
rescue 
end