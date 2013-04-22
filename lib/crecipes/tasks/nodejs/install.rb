begin
  Capistrano::Configuration.instance.load do
    namespace :nodejs do
      desc "Install the latest release of Node.js"
      task :install, roles: :app do
        chelpers.apt_add_repo "chris-lea/node.js"
        chelpers.apt_install "nodejs"
      end
    end
  end

rescue
end
