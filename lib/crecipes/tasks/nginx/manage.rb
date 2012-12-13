begin
  Capistrano::Configuration.instance.load do
    namespace :nginx do
      %w{start stop restart}.each do |command|
      desc "#{command} nginx"
        task command, roles: :web do
          run "#{sudo} service nginx #{command}"
        end
      end
    end
  end
rescue 
end