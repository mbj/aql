require 'spec_helper'

describe AQL::Node::Literal::Composed::Document::Attribute, '#aql' do
  class Node
    include Composition.new(:token)

    def visit(buffer)
      buffer.append(token)
    end
  end

  let(:object)       { described_class.new(Node.new('foo'), Node.new('bar')) }
  let(:expected_aql) { 'foo: bar' }

  it_should_behave_like 'Node#aql'
end
