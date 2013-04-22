begin
  Capistrano::Configuration.instance.load do
    namespace :monit do
      desc "Installing monit"
      task :install do
        chelpers.apt_install 'monit'
      end
    end
  end
rescue 
end