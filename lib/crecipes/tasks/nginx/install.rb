begin
  Capistrano::Configuration.instance.load do
    namespace :nginx do
      desc "Move managing script into /etc/ini.d"
      task :load_init, roles: :web do
        chelpers.move_template 'nginx/nginx_init.erb', '/tmp/nginx'
        run "#{sudo} mv /tmp/nginx /etc/init.d/nginx"
        run "#{sudo} chmod +x /etc/init.d/nginx"
      end

      desc "Install nginx web server"
      task :install, roles: :web do
        chelpers.apt_add_repo "nginx/stable"
        chelpers.apt_install "nginx"
      end
    end 
  end
rescue 
end