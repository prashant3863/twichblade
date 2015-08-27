require "spec_helper"

module TwichBlade
  describe "User" do
    before(:all) {@dbconnection =  DatabaseConnection.new("twichblade_spec").connection}
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
