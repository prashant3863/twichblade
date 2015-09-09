module TwichBlade
  class Tweet
    def initialize(content, username, tweeted_by)
      @username = username
      @content = content
      @tweeted_by = tweeted_by
      @dbconnection = DBConnection.connection
    end

    def publish
      @user_id = @dbconnection.exec("select id from user_info where username = '#{@username}'").field_values('id')[0].to_i
      if @content.length < 141
        @published = true if @dbconnection.exec("insert into tweets values(DEFAULT, $1, LOCALTIMESTAMP, $2, $3)", [@content, @user_id, @tweeted_by])
      else
        @published = false
      end
    end

    def published?
      @published == true if @dbconnection.exec("select * from tweets where content = $1 and user_id = $2", [@content, @user_id])
    end
  end
end
