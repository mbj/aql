require 'spec_helper'

describe AQL::Node::Literal::List, '.constant' do
  let(:object) { described_class }

  subject { object.construct(input) }

  context 'with empty input' do
    let(:input) { [] }

    it { should eql(described_class.new([])) }
  end

  context 'with scalar values as input' do
    let(:input) { [1, 2] }

    it 'should return correct ast' do
      should eql(described_class.new([
        AQL::Node::Literal::Number.new(1),
        AQL::Node::Literal::Number.new(2)
      ]))
    end

  end

  context 'with nested scalar values as input' do
    let(:input) { [1, [2] ] }

    it 'should return correct ast' do
      should eql(described_class.new([
        AQL::Node::Literal::Number.new(1),
        AQL::Node::Literal::List.construct([2])
      ]))
    end
  end

end
