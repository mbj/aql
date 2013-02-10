require 'spec_helper'

describe AQL::Node::Operation::Limit, '#aql' do
  let(:object) { described_class.new(count, offset) }

  context 'without offset' do
    let(:count)  { AQL::Node::Literal.build(10) }
    let(:offset) { nil }

    expect_aql('LIMIT 10')
  end

  context 'with offset' do
    let(:count)  { AQL::Node::Literal.build(10) }
    let(:offset) { AQL::Node::Literal.build(5) }

    expect_aql('LIMIT 5, 10')
  end
end
