require "spec_helper"

module TwichBlade
  describe "TwichBladeCli" do
    let(:cli) { TwichBladeCli.new }

    context "credentials" do
      it "asks for username" do
        expect{ cli.get_username }.to output(/username:/).to_stdout
      end
    end
  end
end


