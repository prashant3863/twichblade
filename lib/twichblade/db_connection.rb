module TwichBlade
  class DatabaseConnection
    def initialize(dbname)
      @dbname = dbname
    end

    def connect
      PG.connect(:dbname => @dbname)
    end
  end
end
