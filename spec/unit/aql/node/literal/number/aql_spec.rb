require 'spec_helper'

describe AQL::Node::Literal::Number, '#aql' do
  let(:object) { described_class.new(string) }

  examples = {
    1          => '1',
    42         => '42',
    -1         => '-1',
    -42        => '-42',
    1.23       => '1.23',
    -99.99     => '-99.99',
    0.1        => '0.1',
    -4.87e103  => '-4.87e+103'
  }

  examples.each do |string, expectation|
    context "with #{string.inspect} as input" do
      let(:string)       { string      }
      let(:expected_aql) { expectation }

      it_should_behave_like 'Node#aql'
    end
  end
end
