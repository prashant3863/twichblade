module TwichBlade
  class Retweet

    def initialize(tweet_id, username)
      @tweet_id = tweet_id
      @username = username
      @dbconncetion = DBConnection.connection
    end

    def tweet_owner
      uid = @dbconncetion.exec("select user_id from tweets where id = #{@tweet_id}").field_values('user_id')[0].to_i
      @tweet_owner = @dbconncetion.exec("select username from user_info where id = #{uid}").field_values('username')[0].to_s
    end

    def retweet_content
      @retweet_content = @dbconncetion.exec("select content from tweets where id = #{@tweet_id}").field_values('content')[0].to_s
    end

    def execute
      tweet = Tweet.new(@retweet_content, @username, @tweet_owner)
      tweet.publish
    end
  end
end
