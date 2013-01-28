require 'spec_helper'

describe AQL::Node::Literal::Constant do
  let(:class_under_test) do
    Class.new(described_class) do
      public_class_method :new
    end
  end
  let(:object) { class_under_test.new(content) }

  let(:content)      { 'content' }
  let(:expected_aql) { content   }

  it_should_behave_like 'Node#aql'
end
