require "spec_helper"

module TwichBlade
  describe "TwichBladeCli" do
    let(:cli) { TwichBladeCli.new }

    context "prompt for credential" do
      it "asks for username" do
        expect{ cli.get_username }.to output(/username:/).to_stdout
      end

      it "ask for password" do
        expect{ cli.get_password }.to output(/password:/).to_stdout
      end
    end

    context "store credential" do
      it "stores the username" do 
        allow(Kernel).to receive(:gets).and_return("prashant")
        expect(cli.get_username).to eq("prashant")
      end

      it "stores the password" do 
        allow(Kernel).to receive(:gets).and_return("foobar")
        expect(cli.get_password).to eq("foobar")
      end
    end

    context "display" do
      it "displays the first page" do
        expect{ cli.first_display }.to output(/1. Signup\n2. Login/).to_stdout
      end
    end
  end
end


