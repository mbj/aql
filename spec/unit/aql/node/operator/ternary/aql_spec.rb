require 'spec_helper'

describe AQL::Node::Operator::Ternary, '#aql' do

  let(:condition) { AQL::Node::Literal.build(true)    }
  let(:left)      { AQL::Node::Literal.build('left')  }
  let(:right)     { AQL::Node::Literal.build('right') }

  let(:object)    { described_class.new(condition, left, right) }

  let(:expected_aql) { 'true ? "left" : "right"' }

  it_should_behave_like 'Node#aql'
end
