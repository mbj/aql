require 'spec_helper'

describe AQL, '.name_ndoe' do
  let(:object) { described_class }

  subject { object.name_node(name) }

  context 'when name is a symbol' do
    let(:name) { :foo }

    it { should eql(AQL::Node::Name.new('foo')) }
  end

  context 'when name is a string' do
    let(:name) { 'foo' }

    it { should eql(AQL::Node::Name.new('foo')) }
  end
end
