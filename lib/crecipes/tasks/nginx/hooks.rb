begin
  Capistrano::Configuration.instance.load do
    %w{start stop restart}.each do |command|
      after "deploy:#{command}", "nginx:#{command}"
    end
  end
rescue
end