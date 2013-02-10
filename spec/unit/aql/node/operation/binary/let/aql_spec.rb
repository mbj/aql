require 'spec_helper'

describe AQL::Node::Operation::Binary::Let, '#aql' do

  let(:left)  { AQL::Node::Name.new('foo') }
  let(:right) { AQL::Node::Literal.build('bar') }
  let(:object) { described_class.new(left, right) }

  expect_aql('LET `foo` = "bar"')
end
