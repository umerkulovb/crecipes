Dir[File.join(File.dirname(__FILE__), 'rake/*.rb')].sort.each { |lib| require lib }