begin
  Capistrano::Configuration.instance.load do
    after "deploy:setup", "resque:setup"
    after "deploy:restart", "resque:restart"
  end
rescue 
end