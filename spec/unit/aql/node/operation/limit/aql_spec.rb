require 'spec_helper'

describe AQL::Node::Operation::Limit, '#aql' do
  let(:object) { described_class.new(count, offset) }

  context 'without offset' do
    let(:count)  { AQL::Node::Literal.build(10) }
    let(:offset) { nil }
    let(:expected_aql) { 'LIMIT 10' }
    it_should_behave_like 'Node#aql'
  end

  context 'with offset' do
    let(:count)  { AQL::Node::Literal.build(10) }
    let(:offset) { AQL::Node::Literal.build(5) }
    let(:expected_aql) { 'LIMIT 5, 10' }
    it_should_behave_like 'Node#aql'
  end
end
