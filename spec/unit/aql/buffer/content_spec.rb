require 'spec_helper'

describe AQL::Buffer, '#content' do
  let(:object) { described_class.new }

  subject { object.content }

  context 'when empty' do

    it { should eql('')   }

    its(:frozen?) { should be(true) }

  end

  context 'when something was emitted' do
    before do
      object.append('foo').append('bar')
    end

    it { should eql('foobar')   }
    its(:frozen?) { should be(true) }
  end
end
