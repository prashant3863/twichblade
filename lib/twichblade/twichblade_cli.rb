module TwichBlade
  class TwichBladeCli

    def initialize(dbconnection)
      @dbconnection = dbconnection
    end

    def index_page
      puts "1. Signup\n2. Login"
    end

    def welcome_message
      puts "Welcome to TwichBlade\n----------\nA place where you can connect to people\nand share your thoughts\n----------\n\n"
    end

    def user_page
      puts "1. Logout"
    end

    def option
      @option = Kernel.gets.chomp
    end

    def delegate(option)
      take_credentials
      @user = User.new(@username, @password)
      if option == "1"
        @user.signup
      elsif option == "2"
        @user.login
      else
        puts "Please enter a valid option"
      end
    end

    def login_delegate(option)
      if option == "1"
        @user.logout
      end
    end

    def run
      welcome_message
      while 1
        index_page
        o = option
        delegate(o)
        if @user.logged_in?
          user_page
          o = option
          login_delegate(o)
        end
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
