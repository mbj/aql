require 'spec_helper'

describe AQL::Node::Literal::Primitive::String, '#aql' do
  let(:object) { described_class.new(string) }

  examples = {
    ''                                    => '""',
    'yikes!'                              => '"yikes!"',
    'this is a "quoted" word'             => '"this is a \"quoted\" word"',
    'this is a longer string.'            => '"this is a longer string."',
    'the path separator on Windows is \\' => '"the path separator on Windows is \\\\"',
    "some newlines \n"                    => '"some newlines \n"'
  }

  examples.each do |string, expectation|
    context "with #{string.inspect} as input" do
      let(:string)       { string      }
      let(:expected_aql) { expectation }

      it_should_behave_like 'Node#aql'
    end
  end
end
