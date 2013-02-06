require 'spec_helper'

describe AQL::Node::Operation, '#keyword' do
  let(:class_under_test) do
    Class.new(described_class) do
      const_set(:KEYWORD, 'KEYWORD')
      public :keyword
    end
  end

  subject { object.keyword }

  let(:object) { class_under_test.new  }

  it { should eql('KEYWORD') }
end
