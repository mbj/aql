require 'spec_helper'

describe AQL::Node::Literal, '.construct' do
  let(:class_under_test) do
    Class.new(described_class) do
      include Composition.new(:input)
    end
  end

  let(:input)  { mock('Input')    }
  let(:object) { class_under_test }

  subject { object.construct(input) }

  it { should eql(class_under_test.new(input)) }
end
