begin
  Capistrano::Configuration.instance.load do
    namespace :nginx do
      task :setup do
        if :app_server_lib == 'passenger'
          passenger.set_version
        end
        helpers.move_template("nginx/nginx_#{app_server_lib}.conf.erb", "/tmp/nginx.conf")
        run "#{sudo} mv -f /tmp/nginx.conf #{nginx_install_path}/conf/nginx.conf"
      end
    end
  end
rescue
end