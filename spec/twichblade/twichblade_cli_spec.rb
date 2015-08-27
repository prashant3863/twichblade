require "spec_helper"

module TwichBlade
  describe "TwichBladeCli" do
    let(:cli) { TwichBladeCli.new }
    
    context "display" do
      it "displays the first page" do
        expect{ cli.index_page }.to output(/1. Signup\n2. Login/).to_stdout
      end

      it "takes the desired option" do
        allow(Kernel).to receive(:gets).and_return("1")
        expect(cli.input).to eq("1")
      end
    end
  end
end


