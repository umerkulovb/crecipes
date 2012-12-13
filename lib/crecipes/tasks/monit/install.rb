begin
  Capistrano::Configuration.instance.load do
    namespace :monit do
      desc "Installing monit"
      task :install do
        helpers.apt_install 'monit'
      end
    end
  end
rescue 
end