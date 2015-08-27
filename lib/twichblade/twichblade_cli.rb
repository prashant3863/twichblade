module TwichBlade
  class TwichBladeCli

    def get_username
      puts "username: "
      username = Kernel.gets.chomp
    end

    def get_password
      puts "password: "
      password = Kernel.gets.chomp
    end

    def first_display
      puts "1. Signup\n2. Login"
    end
  end
end
