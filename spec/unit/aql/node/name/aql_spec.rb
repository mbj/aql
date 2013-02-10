require 'spec_helper'

describe AQL::Node::Name, '#aql' do
  let(:object) { described_class.new(name) }

  context 'with non keyword name' do
    context 'not containing whitespace' do
      let(:name)         { 'foo' }
      expect_aql('`foo`')
    end

    context 'not containing' do
      let(:name)         { 'foo bar' }
      expect_aql('`foo bar`')
    end
  end

  context 'with keyword name' do
    AQL::KEYWORDS.each do |keyword|
      context keyword do
        context 'uppercase' do
          let(:name) { keyword }
          expect_aql(%Q(`#{keyword}`))
        end

        context 'lowercased' do
          let(:name) { keyword.downcase }
          expect_aql(%Q(`#{keyword.downcase}`))
        end
      end
    end
  end
end
