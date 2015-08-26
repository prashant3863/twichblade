require "spec_helper"

module TwichBlade
  describe "DatabaseConnection" do
    it "should check if the connection is established with the database" do
      dbname = "twichblade_spec"
      dbconnection = DatabaseConnection.new(dbname).connect
      expect(dbconnection.connect).to be_a(PG::Connection)
    end
  end
end
