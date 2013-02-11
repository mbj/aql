require 'spec_helper'

describe AQL::Node::Operation::For, '#aql' do
  let(:left)  { AQL::Node::Name.new('left')  }
  let(:body)  { AQL::Node::Name.new('body')  }

  let(:object) { described_class.new(left, right, body) }

  context 'when right is a name' do
    let(:right) { AQL::Node::Name.new('right') }
    expect_aql('FOR `left` IN `right` `body`')
  end

  context 'when right is anything else' do
    let(:right) { AQL::Node::Literal.build([1, 2, 3]) }
    expect_aql('FOR `left` IN ([1, 2, 3]) `body`')
  end
end
