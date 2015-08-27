require "spec_helper"

module TwichBlade
  describe "User" do
    before(:all) {@dbconnection =  DatabaseConnection.new("twichblade_spec").connection}
    before (:each) { @dbconnection.exec("insert into user_info (username, password) values ('prashant', 'foobar')") }
    after (:each) { @dbconnection.exec("delete from user_info") }
    let(:user_1) {User.new("prashant", "foobar", @dbconnection)}
    let(:user_2) {User.new("prashant2", "foobar2", @dbconnection)}

    it "existing username is not availabe for signup" do
      expect(user_1.available?).to eq(false)
    end

    it "non-existing username is available for signup" do
      expect(user_2.available?).to eq(true)
    end
  end
end
