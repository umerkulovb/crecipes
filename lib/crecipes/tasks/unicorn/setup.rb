begin
  Capistrano::Configuration.instance.load do
    namespace :unicorn do
      task :setup, roles: :app do
        run "mkdir -p #{shared_path}/config"
        chelpers.move_template "unicorn/unicorn_config.rb.erb", unicorn_config
        chelpers.move_template "unicorn/unicorn_init.erb", "/tmp/unicorn_init"
        chelpers.move_template "unicorn/nginx.conf.erb", "/tmp/#{application}_nginx.conf"
        run "chmod +x /tmp/unicorn_init"
        run "#{sudo} mv /tmp/unicorn_init /etc/init.d/unicorn_#{application}"
        run "#{sudo} update-rc.d -f unicorn_#{application} defaults"
        run "#{sudo} mv /tmp/#{application}_nginx.conf /etc/nginx/conf.d/"
      end
    end
  end
rescue   
end