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
  end
end


