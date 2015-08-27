module TwichBlade
  class TwichBladeCli

    def get_username
      puts "username: "
      username = Kernel.gets.chomp
    end

    def get_password
      puts "password: "
    end
  end
end
