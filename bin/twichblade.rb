#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), "..", "lib")))

require "figaro"
require "pg"

Figaro.application = Figaro::Application.new(environment: "development", path: "config/application.yml")
Figaro.load

require "twichblade"

dbconnection = TwichBlade::DatabaseConnection.new(ENV["dbname"])
twichblade_cli = TwichBlade::TwichBladeCli.new(dbconnection.connection)
twichblade_cli.run
