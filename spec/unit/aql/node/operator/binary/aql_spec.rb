require 'spec_helper'

describe AQL::Node::Operator::Binary, '#aql' do
  let(:class_under_test) do
    Class.new(described_class) do
      const_set('SYMBOL', '||')
    end
  end

  let(:left)  { AQL::Node::Literal.build(true)  }
  let(:right) { AQL::Node::Literal.build(false) }
  let(:object) { class_under_test.new(left, right) }

  expect_aql('(true || false)')
end
