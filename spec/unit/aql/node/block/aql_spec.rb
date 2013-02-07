require 'spec_helper'

describe AQL::Node::Block, '#aql' do
  let(:object) { described_class.new(elements) }

  context 'with single element' do
    let(:elements) do 
      [AQL::Node::Operation::Unary::Filter.new(AQL::Node::Literal.build(true))]
    end

    let(:name)         { 'foo bar' }
    let(:expected_aql) { 'FILTER true' }

    it_should_behave_like 'Node#aql'
  end

  context 'with multiple elements' do
    let(:elements) do 
      [
        AQL::Node::Operation::Unary::Filter.new(AQL::Node::Literal.build(true)),
        AQL::Node::Operation::Unary::Return.new(AQL::Node::Literal.build(false))
      ]
    end

    let(:name)         { 'foo bar' }
    let(:expected_aql) { 'FILTER true RETURN false' }

    it_should_behave_like 'Node#aql'
  end
end
