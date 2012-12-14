require "capistrano"
require "capistrano/cli"
require "capistrano-resque"

Capistrano::Configuration::Namespaces::Namespace.class_eval do
 def capture(*args)
   parent.capture *args
 end
end
Dir[File.join(File.dirname(__FILE__), "crecipes/*.rb")].sort.each { |lib| require lib }
Dir[File.join(File.dirname(__FILE__), "crecipes/tasks/*.rb")].sort.each { |lib| require lib }
