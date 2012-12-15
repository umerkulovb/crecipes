begin
  Capistrano::Configuration.instance.load do
    after "deploy:setup", "resque:setup"
    unless find_servers(roles: :resque_worker).empty?
      after "deploy:restart", "resque:restart"
    end
  end
rescue 
end