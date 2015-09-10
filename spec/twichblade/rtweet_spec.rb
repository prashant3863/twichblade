require "spec_helper"

module TwichBlade
  describe "Retweet" do
    let(:user) { User.new("prashant", "foobar") }
    let(:tweet) { Tweet.new("hello", "prashant", "prashant") }
    
    before(:all) { @dbconnection = DBConnection.connection }
    before(:each) do 
      @dbconnection.exec("insert into user_info (username, password) values ('prashant', 'foobar')")
      tweet.publish
    end
    after (:each) do 
      @dbconnection.exec("delete from tweets") 
      @dbconnection.exec("delete from user_info")
    end

    def get_tweet_id
      @dbconnection.exec("select id from tweets where content = 'hello'").field_values('id')[0].to_i
    end

    it "finds tweet owner based on the provided tweet id" do
      username = "prashant"
      t_id = get_tweet_id
      retweet = Retweet.new(t_id, username)
      expect(retweet.tweet_owner).to eq("prashant")
    end
  end
end

