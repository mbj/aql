require 'spec_helper'

describe AQL::Node::Operator::Nary, '#aql' do

  let(:object) { class_under_test.new(body) }

  let(:class_under_test) do
    Class.new(described_class) do
      const_set('SYMBOL', 'foo')
    end
  end

  let(:a) { AQL.name_node(:a) }
  let(:b) { AQL.name_node(:b) }
  let(:c) { AQL.name_node(:c) }

  context 'with one element body' do
    let(:body) { [a] }
    expect_aql '`a`'
  end

  context 'with two element body' do
    let(:body) { [a, b] }
    expect_aql '(`a` foo `b`)'
  end

  context 'with three element body' do
    let(:body) { [a, b, c] }
    expect_aql '(`a` foo `b` foo `c`)'
  end
end
