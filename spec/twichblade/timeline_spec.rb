require "spec_helper"

module TwichBlade
  describe "timeline" do
    before(:all) { @dbconnection = DBConnection.connection }
    before (:each) { @dbconnection.exec("insert into user_info (username, password) values ('prashant', 'foobar')")}
    after (:each) do 
      @dbconnection.exec("delete from tweets") 
      @dbconnection.exec("delete from user_info")
    end

    it "should display the past tweets of the user" do
      recent_tweets = [Tweet.new("hello", "prashant", "prashant"), Tweet.new("hello, world", "prashant", "prashant")]
      recent_tweets.each { |x| x.publish }
      timeline = Timeline.new("prashant")
      expect(timeline.create.ntuples).to eq(2)
    end
  end
end
