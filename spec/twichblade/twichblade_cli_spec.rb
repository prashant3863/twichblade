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
    end
  end
end


