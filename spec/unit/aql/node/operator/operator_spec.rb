require 'spec_helper'

describe AQL::Node::Operator, '#operator' do
  let(:class_under_test) do
    symbol = self.symbol
    Class.new(described_class) do
      const_set('SYMBOL', symbol)
      public :operator
    end
  end

  let(:symbol) { mock('Symbol')       }
  let(:object) { class_under_test.new }

  subject { object.operator }

  it { should be(symbol) }
end
