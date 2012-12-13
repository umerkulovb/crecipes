begin
  Capistrano::Configuration.instance.load do
    namespace :logs do
      task :create_file, roles: :app do
        run "touch #{shared_path}/log/#{rails_env}.log"
        run "chmod 0666 #{shared_path}/log/#{rails_env}.log"
      end
    end
  end
rescue 
end