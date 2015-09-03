require "spec_helper"

module TwichBlade

  describe "Tweet" do
    before(:all) { @dbconnection = DBConnection.connection }
    before (:each) { @dbconnection.exec("insert into user_info (username, password) values ('prashant', 'foobar')")}
    after (:each) do 
      @dbconnection.exec("delete from tweets") 
      @dbconnection.exec("delete from user_info")
    end
    let(:tweet) { Tweet.new("hello", "prashant") }
    let(:long_tweet) { Tweet.new("When I was a child I had a fever. My hands felt like two ballons. Now I have got that felling once again, I cant explain, you wont understand.", "prashant") }

    it  "saves content of the tweet for view" do
      tweet.publish
      expect(tweet).to be_published
    end

    it  "do not publish tweets longer than 140 characters" do
      long_tweet.publish
      expect(long_tweet).to_not be_published
    end
  end
end
