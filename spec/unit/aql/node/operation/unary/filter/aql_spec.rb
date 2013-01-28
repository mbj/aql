require 'spec_helper'

describe AQL::Node::Operation::Unary::Filter, '#aql' do
  let(:object) { described_class.new(expression) }

  context 'with constant binary expression' do
    let(:expression)   { AQL::Node::Literal.build(true) }
    let(:expected_aql) { 'FILTER true' }

    it_should_behave_like 'Node#aql'
  end

  context 'with binary expression' do
    let(:expression) do
      foo = AQL::Node::Name.new('foo')
      AQL::Node::Operator::Binary::LessThan.new(foo, AQL::Node::Literal.build(9))
    end

    let(:expected_aql) { 'FILTER (foo < 9)' }

    it_should_behave_like 'Node#aql'
  end
end
