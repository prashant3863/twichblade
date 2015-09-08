require "spec_helper"

module TwichBlade
  describe "Search" do
    before(:all) {@dbconnection =  DBConnection.connection}
    before (:each) { @dbconnection.exec("insert into user_info (username, password) values ('prashant', 'foobar')")}
    after (:each) { @dbconnection.exec("delete from user_info") }

    it "finds the user with given username" do
      username = "prashant"
      search = Search.new(username)
      expect(search.execute).to eq(true)
    end
  end
end
