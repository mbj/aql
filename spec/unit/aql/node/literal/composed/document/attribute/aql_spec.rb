require 'spec_helper'

describe AQL::Node::Literal::Composed::Document::Attribute, '#aql' do
  class Node
    include Concord.new(:token)

    def visit(buffer)
      buffer.append(token)
    end
  end

  let(:object) { described_class.new(Node.new('foo'), Node.new('bar')) }

  expect_aql('foo: bar')
end
