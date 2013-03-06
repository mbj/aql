require 'spec_helper'

describe AQL::Buffer, '#binary' do
  subject { object.binary(left, operator, right) }

  let(:object)   { described_class.new }
  let(:left)     { Node.new('left')  }
  let(:right)    { Node.new('right') }
  let(:operator) { :operator           }

  class Node
    include Concord.new(:name)

    def visit(buffer)
      buffer.append(name)
    end
  end

  its(:content) { should eql('(left operator right)') }

  it_should_behave_like 'a command method'
end
