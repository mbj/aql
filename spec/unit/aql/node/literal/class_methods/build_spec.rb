require 'spec_helper'

describe AQL::Node::Literal, '.build' do
  let(:object) { described_class }

  subject { object.build(input) }

  context 'string' do
    let(:input) { 'foo' }
    it { should eql(AQL::Node::Literal::String.new('foo')) }
  end

  context 'number' do

    context 'fixnum' do
      let(:input) { 1 }
      it { should eql(AQL::Node::Literal::Number.new(1)) }
    end

    context 'float' do
      let(:input) { 1.0 }
      it { should eql(AQL::Node::Literal::Number.new(1.0)) }
    end

  end

  context 'singleton' do

    context 'nil' do
      let(:input) { nil }
      it { should be(AQL::Node::Literal::Singleton::NULL) }
    end

    context 'true' do
      let(:input) { true }
      it { should be(AQL::Node::Literal::Singleton::TRUE) }
    end

    context 'false' do
      let(:input) { false }
      it { should be(AQL::Node::Literal::Singleton::FALSE) }
    end

  end

  context 'array' do

    context 'empty' do
      let(:input) { [] }
      it { should eql(AQL::Node::Literal::List.new([])) }
    end

    context 'scalar values' do
      context 'homogen' do
        let(:input) { [1, 2] }
        it do 
          should eql(AQL::Node::Literal::List.new([
            AQL::Node::Literal::Number.new(1),
            AQL::Node::Literal::Number.new(2)
          ]))
        end
      end

      context 'heterogen' do
        let(:input) { [1, false] }

        specify do 
          should eql(AQL::Node::Literal::List.new([
            AQL::Node::Literal::Number.new(1),
            AQL::Node::Literal::Singleton::FALSE
          ]))
        end
      end
    end

    context 'nested' do
      let(:input) { [[1]] }

      specify do
        should eql(AQL::Node::Literal::List.new([
          AQL::Node::Literal::List.new([
            AQL::Node::Literal::Number.new(1)
          ])
        ]))
      end
    end
  end

  context 'unhandled' do
    let(:input) { :foo }

    it 'should raise error' do
      expect { subject }.to raise_error(RuntimeError, 'No support for literal Symbol')
    end
  end

end
