require "spec_helper"

module TwichBlade
  describe "Signup" do

    it "check for availability of the username" do
      username = "prashant"
      password = "foobar"
      dbconnection = DatabaseConnection.new("twichblade_spec").connect
      signup = Signup.new(username, password, dbconnection)
      expect(signup.available?).to eq(false)
    end
  end
end
