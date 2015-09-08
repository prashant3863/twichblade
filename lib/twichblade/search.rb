module TwichBlade
  class Search
    def initialize(username)
      @username = username
      @dbconnection = DBConnection.connection
    end

    def execute
      query = @dbconnection.exec("select * from user_info where username = '#{@username}'")
      if query.ntuples == 1
        true
      end
    end
  end
end
