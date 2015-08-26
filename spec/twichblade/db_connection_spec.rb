require "spec_helper"

module TwichBlade
  describe "DatabaseConnection" do
    it "should check if the connection is established with the database" do
      dbname = "twichblade_spec"
      environment = "testing"
      dbconnection = DatabaseConnection.new(dbname, environment)
      expect(dbconnection.connect).to be_a(PG::Connection)
    end
  end
end
