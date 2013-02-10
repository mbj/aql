require 'spec_helper'

describe AQL::Node::NULL, '#aql' do
  let(:object) { described_class }

  let(:expected_aql) { '' }

  it_should_behave_like 'Node#aql'
end
