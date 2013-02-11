require 'spec_helper'

describe AQL::Node::Call, '#aql' do
  let(:object) { described_class.new(name, arguments) }

  let(:name) { 'FOO' }

  context 'without arguments' do
    let(:arguments) { [] }

    expect_aql <<-AQL
      FOO()
    AQL
  end

  context 'with single argument' do
    let(:arguments) { [AQL::Node::Literal.build(1)] }

    expect_aql <<-AQL
      FOO(1)
    AQL
  end

  context 'with multiple arguments' do
    let(:arguments) { [AQL::Node::Literal.build(1), AQL::Node::Literal.build(2)] }

    expect_aql <<-AQL
      FOO(1, 2)
    AQL
  end

  context 'with FOR statement as argument' do
    let(:arguments) { [AQL::Node::Operation::For.new(AQL::Node::Name.new('left'), AQL::Node::Name.new('right'), AQL::Node::Name.new('body'))] }

    expect_aql <<-AQL
      FOO((FOR `left` IN `right` `body`))
    AQL
  end
end
