require 'spec_helper'

describe AQL::Node::Literal::Constant, '.construct' do
  let(:object) { described_class }
  subject { object.construct(input) }

  context 'with false as input' do
    let(:input) { false }
    it { should be(AQL::Node::Literal::Constant::FALSE) }
  end

  context 'with true as input' do
    let(:input) { true }
    it { should be(AQL::Node::Literal::Constant::TRUE) }
  end

  context 'with nil as input' do
    let(:input) { nil }
    it { should be(AQL::Node::Literal::Constant::NULL) }
  end

  context 'with anything else' do
    let(:input) { :foo }

    it 'should raise error' do
      expect { subject }.to raise_error(KeyError)
    end
  end
end
