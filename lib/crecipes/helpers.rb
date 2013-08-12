module Crecipes
  module Helpers
    #Install packages. Run chelpers.apt_install %w(package1 package2) or chelpers.apt_install "package1 package2"
    def apt_install(packages)
      packages = packages.split(/\s+/) if packages.respond_to?(:split)
      packages = Array(packages)
      run "#{sudo} apt-get -yq install #{packages.join(" ")}"
    end

    def apt_update
      run "#{sudo} apt-get -qq update"
    end

    def apt_add_repo(repository)
      run "#{sudo} add-apt-repository -y ppa:#{repository}"
      apt_update
    end

    def move_template(from, to)
      erb = File.read(File.join(File.dirname(__FILE__),"templates/#{from}"))
      put ERB.new(erb).result(binding), to
    end
  end
end
Capistrano.plugin :chelpers, Crecipes::Helpers
