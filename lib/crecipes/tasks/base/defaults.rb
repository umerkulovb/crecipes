begin
  Capistrano::Configuration.instance.load do

    set :deploy_to, "/home/#{user}/apps/#{application}/"

    # User details
    _cset :user, 'deployer'
    _cset(:password)      { abort "Please specify password for #{user}" }


    # Application details
    _cset(:application) { abort "Please specify the short name of your application, set :application, 'foo'" }
    _cset :with_rmagick, true
    _cset :use_rbenv_gemset, true
    _cset :ruby_version, '1.9.3-p327'
    _cset :rail_env, 'production'

    #Phusion passenger settings
    _cset :passenger_module, 'nginx'
    _cset :nginx_install_path, '/opt/nginx'


    #Unicorn
    _cset :unicorn_user, user
    _cset :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid" 
    _cset :unicorn_config, "#{shared_path}/config/unicorn.rb" 
    _cset :unicorn_log,  "#{shared_path}/log/unicorn.log"
    _cset :unicorn_workers, 2



    #Nginx setting
    _cset :nginx_port, 80
    _cset :nginx_servername, "localhost"

    #DB
    _cset :db_host, 'localhost'
    _cset :db_adapter, 'postgresql'
    _cset :db_pool, 5
    _cset :db_port, nil
    
    #Web
    _cset :app_server_lib, 'unicorn'
    _cset :server_name, 'example.com'
    
    # SCM settings
    #_cset(:appdir) { "/home/#{user}/apps/#{application}" }
    _cset :scm, :git
    _cset :branch, 'master'
    _cset :deploy_via, 'remote_cache'

    
    default_run_options[:pty] = true # needed for git password prompts
    ssh_options[:forward_agent] = true # use the keys for the person running the cap command to check out the app

    _cset :use_sudo, false

    namespace :deploy do
      desc "Set Up the server"
      task :install do
        helpers.apt_update
        helpers.apt_install "python-software-properties libxml2 libxml2-dev libxslt1-dev"
      end
    end
  end
rescue 
end