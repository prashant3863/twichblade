module TwichBlade
  class User
    def initialize(username, password, dbconnection)
      @username = username
      @password = password
      @dbconnection = dbconnection
    end

    def available?
      result = @dbconnection.exec("select username from user_info where username = '#{@username}'")
      result.ntuples == 0 ? true : false
    end

    def signup
      if available?
        @dbconnection.exec("insert into user_info (username, password) values ('#{@username}', '#{@password}')")
      else
        "Username not available"
      end
    end
  end
end
