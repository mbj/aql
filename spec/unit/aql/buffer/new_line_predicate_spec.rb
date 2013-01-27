require 'spec_helper'

describe AQL::Buffer, '#new_line?' do
  let(:object) { described_class.new }

  subject { object.new_line? }

  context 'when buffer is empty' do
    it { should be(true) }
  end

  context 'when buffer is not empty' do
    context 'and is not on new line' do
      before { object.append('foo') }
 
      it { should be(false) }
    end

    context 'and is on new line' do
      before { object.append("\n") }
 
      it { should be(true) }
    end
  end
end
