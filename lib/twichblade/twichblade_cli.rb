module TwichBlade
  class TwichBladeCli

    def index_page
      puts "1. Signup\n2. Login"
    end

    def input
      input = Kernel.gets.chomp
    end

    private 
    def take_credentials
      print "username: "
      username = Kernel.gets.chomp
      print "password: "
      password = Kernel.gets.chomp
    end
  end
end
