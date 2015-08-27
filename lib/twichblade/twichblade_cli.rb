module TwichBlade
  class TwichBladeCli

    def get_username
      username = Kernel.gets.chomp
    end

    def get_password
      password = Kernel.gets.chomp
    end

    def first_display
      puts "1. Signup\n2. Login"
      input = Kernel.gets.chomp
    end

    def prompt_for_username
      print "username: "
    end

    def prompt_for_password
      print "password: "
    end
  end
end
