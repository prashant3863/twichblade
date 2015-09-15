module TwichBlade
  class Wall

    def initialize(username)
      @username = username
      @dbconnection = DBConnection.connection
    end

    def create
      following_list
      @wall = @following_user_list.map { |x| Timeline.new(x).create }
    end

    private
    def following_list
      @following_user_list = []
      @following_user_list << @username
      @following_user = @dbconnection.exec("select following from follow where follower = '#{@username}'")
      @following_user.each{ |x| @following_user_list << x['following'] }
      @following_user_list
    end
  end
end
