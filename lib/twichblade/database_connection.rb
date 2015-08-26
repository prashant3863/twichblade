module TwichBlade
  class DatabaseConnection
  attr_reader :connection

    def initialize(dbname)
      @dbname = dbname
    end

    def connect
      @connection = PG.connect(:dbname => @dbname)
    end
  end
end
