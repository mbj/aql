require 'spec_helper'

describe AQL::Node::Literal::Singleton, '.construct' do
  let(:object) { described_class }
  subject { object.construct(input) }

  context 'with false as input' do
    let(:input) { false }
    it { should be(AQL::Node::Literal::Singleton::FALSE) }
  end

  context 'with true as input' do
    let(:input) { true }
    it { should be(AQL::Node::Literal::Singleton::TRUE) }
  end

  context 'with nil as input' do
    let(:input) { nil }
    it { should be(AQL::Node::Literal::Singleton::NULL) }
  end

  context 'with anything else' do
    let(:input) { :foo }

    it 'should raise error' do
      expected = RUBY_VERSION < '1.9' ? IndexError : KeyError
      expect { subject }.to raise_error(expected)
    end
  end
end
