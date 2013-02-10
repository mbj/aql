require 'spec_helper'

describe AQL::Node::Attribute, '#aql' do
  let(:object) { described_class.new(target, name) }

  let(:name)   { AQL::Node::Name.new(attribute_name) }
  let(:target) { AQL::Node::Name.new(target_name)    }

  context 'with regular names' do
    let(:target_name) { 'foo' }
    let(:attribute_name) { 'bar' }

    expect_aql('`foo`.`bar`')
  end

  context 'with keyword names' do
    let(:target_name) { 'sort' }
    let(:attribute_name) { 'filter' }

    expect_aql('`sort`.`filter`')
  end
end
