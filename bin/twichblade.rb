#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), "..", "lib")))

require "figaro"
require "pg"

environment = ARGV[0]

Figaro.application = Figaro::Application.new(environment: "#{environment}", path: "config/application.yml")
Figaro.load

require "io/console"
require "twichblade"

dbconnection = TwichBlade::DatabaseConnection.new(ENV["dbname"], ENV["host"], ENV["dbuser"], ENV["password"])
twichblade_cli = TwichBlade::TwichBladeCli.new
twichblade_cli.run
