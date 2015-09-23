require 'simplecov'
SimpleCov.start
require "pg"
require "figaro"
require "pry"

Figaro.application = Figaro::Application.new(environment: "testing", path: "config/application.yml")
Figaro.load

require "twichblade"

