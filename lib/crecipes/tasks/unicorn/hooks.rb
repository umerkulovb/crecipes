begin
  Capistrano::Configuration.instance.load do
    %w[start stop restart].each do |command|
      after "deploy:#{command}", "unicorn:#{command}"
    end
    if app_server_lib == 'unicorn'
      after "deploy:setup", "unicorn:setup"
    end
  end
rescue
end