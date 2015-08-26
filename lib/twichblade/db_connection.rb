module TwichBlade
  class DatabaseConnection
    def initialize(dbname, environment)
      @dbname = dbname
      @environment = environment
    end

    def connect
      PG.connect(:dbname => @dbname)
    end
  end
end
