require 'spec_helper'

describe AQL::Node::Literal::Composed::List, '#aql' do
  let(:object) { AQL::Node::Literal.build(input) }

  examples = {
    []                                        => '[]',
    [1, 2, 3]                                 => '[1, 2, 3]',
    [-99, "yikes!", [ true, [ "no"], []], 1 ] => '[-99, "yikes!", [true, ["no"], []], 1]',
    [["fox", "marshal"]]                      => '[["fox", "marshal"]]',
    [nil]                                     => '[null]'
  }

  examples.each do |input, expectation|
    context "with #{input.inspect} as input" do
      let(:input) { input }
      expect_aql(expectation)
    end
  end
end
