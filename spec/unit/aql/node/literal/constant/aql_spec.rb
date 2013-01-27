require 'spec_helper'

describe AQL::Node::Literal::Constant do
  let(:object) { described_class.new(content) }

  let(:content)      { 'content' }
  let(:expected_aql) { content   }

  it_should_behave_like 'Node#aql'
end
