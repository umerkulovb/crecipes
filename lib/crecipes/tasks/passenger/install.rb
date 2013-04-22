begin
  Capistrano::Configuration.instance.load do
    namespace :passenger do
      desc "Install Passenger"
      task :install, roles: :app do
        chelpers.apt_install "libcurl4-openssl-dev"
        run "gem install passenger --no-ri --no-rdoc"
        run "rbenv rehash"
        command = "#{sudo} sh -c \"PATH=\"$PATH\" passenger-install-#{passenger_module}-module --auto"
        if passenger_module == 'nginx'
          command += " --auto-download --prefix=#{nginx_install_path} "
        end
        run "#{command}\""
      end

      task :set_version, roles: :web do
        version = 'ERROR' # default

        # passenger (2.X.X, 1.X.X)
        run("gem list | grep passenger") do |ch, stream, data|
          version = data.sub(/passenger \(([^,]+).*?\)/,"\\1").strip
        end
        _cset :passenger_version, version
      end

    end
  end
rescue 
end