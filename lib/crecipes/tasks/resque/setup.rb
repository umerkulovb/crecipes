begin
  Capistrano::Configuration.instance.load do
    namespace :resque do
      desc "Installing resque dependencies"
      task :setup do
        helpers.apt_install "redis-server"
      end
    end
  end
rescue 
end