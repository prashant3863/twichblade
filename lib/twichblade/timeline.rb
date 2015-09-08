module TwichBlade
  class Timeline
    def initialize(username)
      @username = username
      @dbconnection= DBConnection.connection
    end

    def create
      user_id = @dbconnection.exec("select id from user_info where username = '#{@username}'").field_values('id')[0].to_i
      timeline = @dbconnection.exec("select content from tweets where user_id = $1", [user_id]).field_values('content')
    end
  end
end
