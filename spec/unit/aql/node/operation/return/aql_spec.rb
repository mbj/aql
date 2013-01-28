require 'spec_helper'

describe AQL::Node::Operation::Return, '#aql' do
  let(:object) { described_class.new(expression) }

  context 'with scalar expression' do
    let(:expression)   { AQL::Node::Literal.build(1) }
    let(:expected_aql) { 'RETURN 1' }

    it_should_behave_like 'Node#aql'
  end

  context 'with document expression' do
    let(:expression)   { AQL::Node::Literal.build(1 => 1) }
    let(:expected_aql) { 'RETURN {1: 1}' }

    it_should_behave_like 'Node#aql'
  end
end
