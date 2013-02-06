require 'spec_helper'

describe AQL::Buffer, '.utf8_encode' do
  let(:object) { described_class }

  unless defined?(Encoding)
    before do
      pending "No support for encodings under #{Devtools.rvm}"
    end
  end

  subject { object.utf8_encode(input) }

  let(:input)  { mock('Input') }
  let(:output) { mock('Output') }

  it 'should modify input encoding' do
    input.should_receive(:encode).with(Encoding::UTF_8).and_return(output)
    should be(output)
  end
end
