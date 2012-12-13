begin
  Capistrano::Configuration.instance.load do
    after "deploy:finalize_update", "db:symlink"
  end
rescue 
end