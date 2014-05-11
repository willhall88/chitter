# Generated by cucumber-sinatra. (2014-05-11 18:34:01 +0100)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', './lib/chitter.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Chitter

class ChitterWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ChitterWorld.new
end