require 'spec_helper'

describe AQL::Node, '#visit' do
  let(:class_under_test) do
    Class.new(described_class) do

    private

      def emit(buffer)
        buffer.append('foo')
      end

    end
  end

  let(:object) { class_under_test.new }

  subject { object.visit(buffer) }

  let(:buffer) { AQL::Buffer.new }

  it 'should emit node' do
    expect { subject }.to change { buffer.content }.from('').to('foo')
  end

  it_should_behave_like 'a command method'
end
