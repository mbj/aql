require 'spec_helper'

describe AQL::Node::Literal::Singleton do

  let(:class_under_test) do
    Class.new(described_class) do
      public_class_method :new
    end
  end

  let(:object) { class_under_test.new('content') }

  expect_aql('content')
end
