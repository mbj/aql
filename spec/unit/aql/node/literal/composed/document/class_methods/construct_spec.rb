require 'spec_helper'

describe AQL::Node::Literal::Composed::Document, '.construct' do
  let(:object) { described_class }
  let(:subject) { object.construct(input) }

  context 'without attributes' do
    let(:input) { {} }

    it { should eql(described_class.new([])) }
  end

  context 'with attributes' do
    let(:input) { { 1 => 2 } }

    let(:attribute) do 
      AQL::Node::Literal::Composed::Document::Attribute.new(
        AQL::Node::Literal.build(1), AQL::Node::Literal.build(2)
      )
    end

    it { should eql(described_class.new([attribute])) }
  end
end
