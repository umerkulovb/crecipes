begin
  Capistrano::Configuration.instance.load do
    after "deploy:install", "nodejs:install"
  end
  
rescue 
end