require 'spec_helper'

describe AQL::Node::Name, '#aql' do
  let(:object) { described_class.new(name) }

  context 'with non keyword name' do
    context 'not containing whitespace' do
      let(:name)         { 'foo' }
      let(:expected_aql) { '`foo`' }

      it_should_behave_like 'Node#aql'
    end

    context 'not containing' do
      let(:name)         { 'foo bar' }
      let(:expected_aql) { '`foo bar`' }

      it_should_behave_like 'Node#aql'
    end
  end

  context 'with keyword name' do
    AQL::KEYWORDS.each do |keyword|
      context keyword do
        context 'uppercase' do
          let(:name)         { keyword          }
          let(:expected_aql) { %Q(`#{keyword}`) }

          it_should_behave_like 'Node#aql'
        end

        context 'lowercased' do
          let(:name)         { keyword.downcase }
          let(:expected_aql) { %Q(`#{keyword.downcase}`) }

          it_should_behave_like 'Node#aql'
        end
      end
    end
  end
end
