require 'spec_helper'

describe AQL::Node::Operation::Nary, '#aql' do
  let(:class_under_test) do
    Class.new(described_class) do
      const_set(:KEYWORD, 'KEYWORD')
    end
  end

  let(:foo)          { AQL::Node::Name.new('foo') }
  let(:bar)          { AQL::Node::Name.new('bar') }

  let(:object)       { class_under_test.new([foo, bar]) }
  let(:expected_aql) { 'KEYWORD `foo`, `bar`'               }

  it_should_behave_like 'Node#aql'
end
