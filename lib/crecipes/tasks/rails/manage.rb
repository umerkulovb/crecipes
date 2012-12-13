begin
  Capistrano::Configuration.instance.load do
    namespace :rails do
    end
  end
rescue 
end