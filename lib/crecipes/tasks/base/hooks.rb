begin
  Capistrano::Configuration.instance.load do
    before "deploy", "check:revision"
    before "deploy:migrations", "check:revision"
    #before "deploy:cold", "check:revision"
    after "deploy:setup", "logs:create_file"
    
    # keep only the last 5 releases
    after "deploy", "deploy:cleanup" 
  end
rescue 
end