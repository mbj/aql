require 'spec_helper'

describe AQL::Node::Literal, '#handle' do
  Dummy = Class.new do
    include Equalizer.new
  end

  let(:object) { described_class }

  subject { object.build(Dummy.new) }

  let(:input) { Dummy.new }

  let(:class_under_test) do
    Class.new(described_class) do
      include Concord.new(:object)
      handle(Dummy)
    end
  end

  it { should eql(class_under_test.new(input)) }
end
