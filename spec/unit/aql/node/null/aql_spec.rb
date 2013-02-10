require 'spec_helper'

describe AQL::Node::NULL, '#aql' do
  let(:object) { described_class }

  expect_aql('')
end
