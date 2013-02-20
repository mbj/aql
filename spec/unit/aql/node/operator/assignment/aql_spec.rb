require 'spec_helper'

describe AQL::Node::Operator::Assignment, '#aql' do

  let(:name)  { AQL.name_node('name')             }
  let(:value) { AQL::Node::Literal.build(false)   }
  let(:object) { described_class.new(name, value) }

  expect_aql('`name` = false')
end
