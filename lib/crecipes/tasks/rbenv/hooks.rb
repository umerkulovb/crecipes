begin
  Capistrano::Configuration.instance.load do
    after "deploy:install", "rbenv:install"
  end  
rescue
end
