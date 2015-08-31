module TwichBlade
  class TwichBladeCli
    def initialize(dbconnection)
      @dbconnection = dbconnection
    end

    def index_page
      puts "1. Signup\n2. Login"
    end

    def option
      @option = Kernel.gets.chomp
    end

    def delegate(option)
      if option == "1"
        take_credentials
        User.new(@username, @password, @dbconnection).signup
      elsif option == "2"
        take_credentials
        User.new(@username, @password, @dbconnection).login
      end
    end

    def run
      while 1
        index_page
        o = option
        delegate(o)
      end
    end

    private 
    def take_credentials
      print "username: "
      @username = Kernel.gets.chomp
      print "password: "
      @password = Kernel.gets.chomp
    end
  end
end
