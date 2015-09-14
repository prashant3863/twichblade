module TwichBlade
  class Follow
    def initialize(follower, following)
      @follower = follower
      @following = following
      @dbconnection = DBConnection.connection
    end

    def do
      if user_exists? && !followed?
        follow = @dbconnection.exec("insert into follow values(DEFAULT, $1, $2)", [@follower, @following])
        true
      else
        false
      end
    end

    private
    def user_exists?
      Search.new(@following).execute
    end

    def followed?
      if @dbconnection.exec("select * from follow where follower = '#{@follower}' and following = '#{@following}'").ntuples == 1
        true
      else
        false
      end
    end
  end
end
