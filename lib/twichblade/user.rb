module TwichBlade
  class User
    attr_reader :flag
    def initialize(username, password, dbconnection)
      @username = username
      @password = password
      @dbconnection = dbconnection
      @logged_in = false
    end

    def signup
      result = @dbconnection.exec("select username from user_info where username = '#{@username}'")
      available = true if result.ntuples == 0 
      if available
        @dbconnection.exec("insert into user_info (username, password) values ('#{@username}', '#{@password}')")
        puts "Signup sucessfull\n\n"
      else
        puts "Username not available\n\n"
      end
    end

    def login
      res = @dbconnection.exec("select * from user_info where username = '#{@username}' and password = '#{@password}'")
      registered = true if res.ntuples == 1 
      if registered 
        puts "Login sucessfull\n\n"
        @logged_in = true
      else
        puts "Incorrect Username or Password\n\n"
        @logged_in = false
      end
    end

    def logout
      @logged_in = false
    end

    def logged_in?
      @logged_in == true
    end
  end
end
