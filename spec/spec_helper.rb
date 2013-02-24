# encoding: utf-8

require 'devtools'
require 'aql'
require 'rspec'

Devtools.init_spec_helper

RSpec.configure do |config|
  config.extend(AQLHelper)
end
