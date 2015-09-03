module TwichBlade
  class Tweet
    def initialize(content, username)
      @username = username
      @content = content
      @dbconnection = DBConnection.connection
    end

    def publish
      @user_id = @dbconnection.exec("select id from user_info where username = '#{@username}'").field_values('id')[0].to_i
      if @content.length < 141
        @published = true if @dbconnection.exec("insert into tweets (content, date_time, user_id) values ('#{@content}', LOCALTIMESTAMP, #{@user_id})")
      else
        @published = false
      end
    end

    def published?
      @published == true if @dbconnection.exec("select * from tweets where content = '#{@content}' and user_id = '#{@user_id}'")
    end
  end
end

