require "spec_helper"

module TwichBlade
  describe "Wall" do
    before(:all) { @dbconnection = DBConnection.connection }
    before (:each) do
      @dbconnection.exec("insert into user_info (username, password) values ('prashant', 'foobar')")
      @dbconnection.exec("insert into user_info (username, password) values ('pro', 'foo')")
      @dbconnection.exec("insert into user_info (username, password) values ('aninda', 'bar')")
      Tweet.new("Hi", "prashant", "prashant").publish
      Tweet.new("Heya", "pro", "pro").publish
      Tweet.new("Hello", "aninda", "aninda").publish
    end
    after (:each) do 
      @dbconnection.exec("delete from follow")
      @dbconnection.exec("delete from tweets")
      @dbconnection.exec("delete from user_info")
    end

    it "should display the tweets of all the people a user is following" do
      follow = [Follow.new('prashant', 'pro').do, Follow.new('prashant', 'aninda').do]
      wall = Wall.new("prashant")
      expect(wall.create[0].ntuples).to eq(1)
    end
  end
end
