begin
  Capistrano::Configuration.instance.load do
    after "deploy:install", "passenger:install"
  end
rescue 
end