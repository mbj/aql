require 'spec_helper'

describe AQL::Node::Operation::Nary::Collect::Into, '#aql' do

  let(:object) { described_class.new(body, name) }

  let(:body) { [AQL.name_node('foo'), AQL.name_node('bar')] }
  let(:name) { AQL.name_node('baz') }

  expect_aql('COLLECT `foo`, `bar` INTO `baz`')
end
