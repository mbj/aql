require 'spec_helper'

describe AQL::Buffer, '.wrap_delimited' do
  let(:object) { described_class.new }

  subject { object.wrap_delimited(open, nodes, close) }

  let(:open) { '[' }
  let(:close) { ']' }

  context 'without nodes' do
    let(:nodes) { [] }

    its(:content) { should eql('[]') }

    it_should_behave_like 'a command method'
  end

  class Node
    include Concord.new(:name)

    def visit(buffer)
      buffer.append(name)
    end
  end

  context 'with one node' do
    let(:nodes) { [Node.new('A')] }

    its(:content) { should eql('[A]') }

    it_should_behave_like 'a command method'
  end

  context 'with two nodes' do
    let(:nodes) { [Node.new('A'), Node.new('B')] }

    its(:content) { should eql('[A, B]') }

    it_should_behave_like 'a command method'
  end
end
