require 'spec_helper'

describe AQL::Node::Operation::For, '#aql' do
  let(:left)         { AQL::Node::Name.new('left')  }
  let(:right)        { AQL::Node::Name.new('right') }
  let(:body)         { AQL::Node::Name.new('body')  }

  let(:object)       { described_class.new(left, right, body) }

  expect_aql('FOR `left` IN `right` `body`')
end
