require 'spec_helper'

describe AQL::Node::Null, '#aql' do
  let(:object) { described_class }

  let(:expected_aql) { '' }

  it_should_behave_like 'Node#aql'
end
