module TwichBlade
  class DatabaseConnection
  attr_reader :connection

    def initialize(dbname)
      @connection = PG.connect(:dbname => dbname)
      @connection
    end
  end
  DBConnection = DatabaseConnection.new(ENV['dbname'])
end
