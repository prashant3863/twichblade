module TwichBlade
  class Retweet

    def initialize(tweet_id, username)
      @tweet_id = tweet_id
      @username = username
      @dbconncetion = DBConnection.connection
    end

    def uid
      @uid = @dbconncetion.exec("select user_id from tweets where id = #{@tweet_id}").field_values('user_id')[0].to_i
    end
  end
end
