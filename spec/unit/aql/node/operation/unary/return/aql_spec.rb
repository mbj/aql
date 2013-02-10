require 'spec_helper'

describe AQL::Node::Operation::Unary::Return, '#aql' do
  let(:object) { described_class.new(expression) }

  context 'with scalar expression' do
    let(:expression)   { AQL::Node::Literal.build(1) }

    expect_aql('RETURN 1')
  end

  context 'with document expression' do
    let(:expression)   { AQL::Node::Literal.build(1 => 1) }

    expect_aql('RETURN {1: 1}')
  end
end
