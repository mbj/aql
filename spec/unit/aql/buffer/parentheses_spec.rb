require 'spec_helper'

describe AQL::Buffer, '#parentheses' do
  let(:object) { described_class.new }

  subject { object.parentheses(*arguments, &block) }

  let(:block) { proc { object.append('foo') } }

  context 'without arguments' do
    let(:arguments) { [] }

    its(:content) { should eql('(foo)') }

    it_should_behave_like 'a command method'
  end

  context 'with first argument' do
    let(:arguments) { ['first '] }

    its(:content) { should eql('first foo)') }

    it_should_behave_like 'a command method'
  end

  context 'with first and second argument' do
    let(:arguments) { ['first ', ' second'] }

    its(:content) { should eql('first foo second') }

    it_should_behave_like 'a command method'
  end
end
