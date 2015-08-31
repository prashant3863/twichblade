require "spec_helper"

module TwichBlade
  describe "TwichBladeCli" do
    before(:all) {@dbconnection =  DatabaseConnection.new("twichblade_spec").connection}
    let(:cli) { TwichBladeCli.new(@dbconnection) }
    after (:each) { @dbconnection.exec("delete from user_info") }

    it "displays the index page" do
      expect{ cli.index_page }.to output(/1. Signup\n2. Login/).to_stdout
    end

    it "takes the desired option" do
      allow(Kernel).to receive(:gets).and_return("1")
      expect(cli.option).to eq("1")
    end

    it "displays welcome message" do
      expect{ cli.welcome_message }.to output(/Welcome to TwichBlade\n---------\nA place where you can connect to people\nand share your thoughts\n---------\n/).to_stdout
    end

    context "delegator" do
      it "calls signup on user when 1 is selcted" do
        input = "1"
        allow(Kernel).to receive(:gets).and_return('prashant', 'foobar')
        expect{ cli.delegate(input) }.to output(/Signup sucessfull/).to_stdout
      end

      it "calls login on user when 2 is selcted" do
        input = "2"
        allow(Kernel).to receive(:gets).and_return('prashant', 'foobar')
        expect{ cli.delegate(input) }.to output(/User not registered/).to_stdout
      end
    end
  end
end


