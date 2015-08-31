module TwichBlade
  class User
    def initialize(username, password, dbconnection)
      @username = username
      @password = password
      @dbconnection = dbconnection
    end

    def signup
      result = @dbconnection.exec("select username from user_info where username = '#{@username}'")
      available = true if result.ntuples == 0 
      if available
        @dbconnection.exec("insert into user_info (username, password) values ('#{@username}', '#{@password}')")
        puts "Signup sucessfull"
      else
        puts "Username not available"
      end

      def login
        result = @dbconnection.exec("select username from user_info where username = '#{@username}'")
        available = true if result.ntuples == 0 
        if available
          puts "User not registered"
        end
      end
    end
  end
end
