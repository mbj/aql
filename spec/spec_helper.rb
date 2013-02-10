# encoding: utf-8

require 'devtools'
require 'aql'
require 'rspec'

# require spec support files and shared behavior
Dir[File.expand_path('../{support,shared}/**/*.rb', __FILE__)].each { |f| require(f) }

if RUBY_VERSION < '1.9'
  require 'rspec/autorun'
end

module AQLHelper
  def compress_aql(string)
    string.gsub(/^[ ]*/, '').split("\n").join(' ')
  end

  def expect_aql(string)
    expected_aql = compress_aql(string)
    subject { object.aql }
    it_should_behave_like 'an idempotent method'
    it { should eql(expected_aql) }
  end
end

RSpec.configure do |config|
  config.extend(AQLHelper)
end
