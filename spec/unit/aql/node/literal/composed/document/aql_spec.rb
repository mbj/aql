require 'spec_helper'

describe AQL::Node::Literal::Composed::Document, '#aql' do
  let(:object) { AQL::Node::Literal.build(input) }

  if RUBY_VERSION < '1.9'
    before do
      pending 'Test for ordered hashes, ruby 1.8 has unordered ones'
    end
  end

  examples = {
    {}                    => '{}',
    { 'name' => 'Peter' } => '{"name": "Peter"}',
    { 
      'name'     => 'John', 
      'likes'    => %w(Swimming Skiing),
      'address'  => {
        'street' => 'Cucumber lane',
        'zip'    => '94242'
      }
    } => '{"name": "John", "likes": ["Swimming", "Skiing"], "address": {"street": "Cucumber lane", "zip": "94242"}}'
  }

  examples.each do |input, expectation|
    context "with #{input.inspect} as input" do
      let(:input)        { input       }

      expect_aql(expectation)
    end
  end
end
