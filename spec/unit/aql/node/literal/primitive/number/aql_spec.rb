require 'spec_helper'

describe AQL::Node::Literal::Primitive::Number, '#aql' do
  let(:object) { described_class.new(number) }

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

  examples.each do |number, expectation|
    context "with #{number.inspect} as input" do
      let(:number)       { number      }
      let(:expected_aql) { expectation }

      it_should_behave_like 'Node#aql'
    end
  end
end
