require "spec_helper"

module TwichBlade
  describe "User" do
    before(:all) {@dbconnection =  DBConnection.connection}
    before (:each) { @dbconnection.exec("insert into user_info (username, password) values ('prashant', 'foobar')")}
    after (:each) do
      @dbconnection.exec("delete from tweets") 
      @dbconnection.exec("delete from user_info")
    end
    let(:user_1) { User.new("prashant", "foobar") }
    let(:user_2) { User.new("prashant2", "foobar2") }

    context "signup" do
      it "should register a user for available username" do
        user_2.signup
        expect(user_2).to be_signed_up
      end

      it "should not register a user for already existing username" do
        expect{ user_1.signup }.to output(/Username not available/).to_stdout
      end
    end

    context "login" do
      it "should not let unregistered user login" do
        user_2.login
        expect(user_2).not_to be_logged_in
      end

      it "should print unsucessfull login message when login fails" do
        expect{ user_2.login }.to output(/Incorrect Username or Password/).to_stdout
      end

      it "should let registered user login" do
        user_1.login
        expect(user_1).to be_logged_in
      end

      it "should print sucessfull login message when login" do
        expect{ user_1.login }.to output(/Login sucessfull/).to_stdout
      end
    end

    context "logout" do
      it "should logout a user" do
        user_1.logout
        expect(user_1).not_to be_logged_in
      end
    end
  end
end
