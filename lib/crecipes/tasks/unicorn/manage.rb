begin
  Capistrano::Configuration.instance.load do
    namespace :unicorn do
      %w[start stop restart].each do |command|
        desc "#{command} unicorn server"
        task command, roles: :app, except: {no_release: true} do
          if command == 'restart'
            run "/etc/init.d/unicorn_#{application} stop"
            run "/etc/init.d/unicorn_#{application} start"
          else
            run "/etc/init.d/unicorn_#{application} #{command}"
          end
        end

      end

    end
  end
rescue
end