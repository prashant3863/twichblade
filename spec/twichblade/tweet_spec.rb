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
    
    context "publish" do
      it  "saves content of the tweet for view" do
        tweet.publish
        expect(tweet).to be_published
      end
    end
  end
end
