require "spec_helper"

module TwichBlade
  describe "TwichBladeCli" do
    before(:all) {@dbconnection =  DatabaseConnection.new("twichblade_spec").connection}
    let(:cli) { TwichBladeCli.new }
    let(:tweet) { Tweet.new("Hello, There.", "prashant", "prashant") }
    let(:user) {  User.new("prashant", "foobar")}
    let(:search) { Search.new("prashant") }
    after (:each) do
      @dbconnection.exec("delete from tweets")
      @dbconnection.exec("delete from user_info")
    end

    it "displays the index page" do
      expect{ cli.index_page }.to output(/1. Signup\n2. Login/).to_stdout
    end

    it "takes the desired option" do
      allow(Kernel).to receive(:gets).and_return("1")
      expect(cli.option).to eq("1")
    end

    it "displays welcome message" do
      expect{ cli.welcome_message }.to output(/Welcome to TwichBlade\n----------\nA place where you can connect to people\nand share your thoughts\n----------\n\n/).to_stdout
    end

    it "displays page after user logs in" do
      expect{ cli.user_page }.to output(/1. Logout/).to_stdout
    end

    context "delegator" do
      it "calls signup on user when 1 is selcted" do
        input = "1"
        allow(Kernel).to receive(:gets).and_return('prashant', 'foobar')
        allow(User).to receive(:new).and_return(user)
        expect(user).to receive(:signup)
        cli.delegate(input)
      end

      it "calls login on user when 2 is selcted" do
        input = "2"
        allow(Kernel).to receive(:gets).and_return('prashant', 'foobar')
        allow(User).to receive(:new).and_return(user)
        expect(user).to receive(:login)
        cli.delegate(input)
      end

      it "user exits the application when 3 is selcted" do
        input = "3"
        expect{ cli.delegate(input) }.to raise_error(SystemExit)
      end

      it "displays invalid option message" do
        input = "4"
        allow(Kernel).to receive(:gets).and_return('prashant', 'foobar')
        expect{ cli.delegate(input) }.to output(/Please enter a valid option/).to_stdout
      end
    end

    context "login delegate" do
      before (:each) { @dbconnection.exec("insert into user_info (username, password) values ('prashant', 'foobar')")}
      
      it "logs out the user when logout option is selected" do
        allow(User).to receive(:new).and_return(user)
        cli.delegate('2')
        expect(user).to receive(:logout)
        cli.login_delegate('1')
      end

      it "user can tweet when tweet option is selected" do
        allow(User).to receive(:new).and_return(user)
        cli.delegate('2')
        allow(Tweet).to receive(:new).and_return(tweet)
        expect(tweet).to receive(:publish)
        cli.login_delegate('2')
      end

      it "user can see all his past tweets when timeline option is selected" do
        allow_any_instance_of(User).to receive(:new)
        cli.delegate('2')
        expect_any_instance_of(TwichBladeCli).to receive(:timeline_print)
        cli.login_delegate('3')
      end

      it "shows timeline of the searched user if the searched user exist" do
        allow_any_instance_of(User).to receive(:new)
        cli.delegate('2')
        allow_any_instance_of(Search).to receive(:execute).and_return(true)
        expect_any_instance_of(TwichBladeCli).to receive(:search_timeline_print)
        cli.login_delegate('4')
      end

      it "shows timeline of the searched user if the searched user doesnot exist" do
        allow_any_instance_of(User).to receive(:new)
        cli.delegate('2')
        allow_any_instance_of(Search).to receive(:execute).and_return(false)
        expect{ cli.login_delegate('4') }.to output(/User Does not Exist/).to_stdout
      end
    end
  end
end
