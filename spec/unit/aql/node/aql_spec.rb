require 'spec_helper'

describe AQL::Node, 'aql' do

  subject { object.aql }

  let(:class_under_test) do
    Class.new(described_class) do
      def emit(buffer)
        buffer.append('foo')
      end
    end
  end

  let(:object) { class_under_test.new }

  it { should eql('foo') }

end
