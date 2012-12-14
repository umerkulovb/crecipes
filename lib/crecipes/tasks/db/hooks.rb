begin
  Capistrano::Configuration.instance.load do
    after "deploy:finalize_update", "db:symlink"
    after "deploy:setup", "db:setup"
  end
rescue 
end