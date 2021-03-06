require "spec_helper"

module TwichBlade

  describe "Follow" do
    before(:all) { @dbconnection = DBConnection.connection }
    before (:each) do
      @dbconnection.exec("insert into user_info (username, password) values ('prashant', 'foobar')")
      @dbconnection.exec("insert into user_info (username, password) values ('pro', 'foo')")
    end
    after (:each) do 
      @dbconnection.exec("delete from follow")
      @dbconnection.exec("delete from user_info")
    end

    it "follow the user with specified username" do
      follower = "prashant"
      following = "pro"
      follow = Follow.new(follower, following)
      expect(follow.do).to eq(true)
    end

    it "do not follow user that is not registered" do
      follower = "prashant"
      following = "random"
      follow = Follow.new(follower, following)
      expect(follow.do).to eq(false)
    end

    context "refollow" do
      before(:each) { @dbconnection.exec("insert into follow (follower, following) values ('prashant', 'pro')") }

      it "should not follow already followed users" do
        follow = Follow.new("prashant", "pro")
        expect(follow.do).to eq(false)
      end
    end
  end 
end

