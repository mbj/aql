require 'spec_helper'

describe AQL::Node::Operation::Unary, '#aql' do
  let(:class_under_test) do
    Class.new(described_class) do
      const_set('KEYWORD', 'KEYWORD')
    end
  end

  let(:object) { class_under_test.new(AQL::Node::Literal.build(1)) }
  expect_aql('KEYWORD 1')
end
