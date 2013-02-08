begin
  Capistrano::Configuration.instance.load do
    namespace :rake do
      desc "Run specified rake task"
      task :run, roles: :app do
        run("cd #{current_path} && RAILS_ENV=#{rail_env} bundle exec rake #{task}")`
      end
    end
  end
rescue
end