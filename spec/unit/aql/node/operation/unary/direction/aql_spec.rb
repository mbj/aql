require 'spec_helper'

describe AQL::Node::Operation::Unary::Direction, '#aql' do
  let(:class_under_test) do
    Class.new(described_class) do
      const_set(:KEYWORD, 'KEYWORD')
    end
  end

  let(:foo)          { AQL::Node::Name.new('foo') }
  let(:object)       { class_under_test.new(foo)  }
  let(:expected_aql) { '`foo` KEYWORD'              }

  it_should_behave_like 'Node#aql'
end
