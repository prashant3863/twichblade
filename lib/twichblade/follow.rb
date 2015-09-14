module TwichBlade
  class Follow
    def initialize(follower, following)
      @follower = follower
      @following = following
      @dbconnection = DBConnection.connection
      @follower_id = @dbconnection.exec("select id from user_info where username = '#{@follower}'").field_values('id')[0].to_i
      @following_id = @dbconnection.exec("select id from user_info where username = '#{@following}'").field_values('id')[0].to_i
    end

    def do
      if user_exists?
        follow = @dbconnection.exec("insert into follow values(DEFAULT, $1, $2)", [@follower_id, @following_id])
        true
      end
    end

    private
    def user_exists?
      Search.new(@following)
    end
  end
end
