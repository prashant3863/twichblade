module TwichBlade
  class DatabaseConnection
  attr_reader :connection

    def initialize(dbname, host, dbuser)
      @connection = PG.connect(:dbname => dbname, :user => dbuser, :host => host, :port => 5432)
      @connection
    end
  end
  DBConnection = DatabaseConnection.new(ENV['dbname'], ENV['host'], ENV['dbuser'])
end
