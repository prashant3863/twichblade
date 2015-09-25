module TwichBlade
  class DatabaseConnection
  attr_reader :connection

    def initialize(dbname, host, dbuser, password)
      @connection = PG.connect(:dbname => dbname, :user => dbuser, :password => password, :host => host, :port => 5432)
      @connection
    end
  end
  DBConnection = DatabaseConnection.new(ENV['dbname'], ENV['host'], ENV['dbuser'], ENV['password'])
end
