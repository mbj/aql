require 'spec_helper'

describe AQL::Node::Attribute, '#aql' do
  let(:object) { described_class.new(target, name) }

  let(:name)   { AQL::Node::Name.new(attribute_name) }
  let(:target) { AQL::Node::Name.new(target_name)    }

  context 'with regular names' do
    let(:target_name) { 'foo' }
    let(:attribute_name) { 'bar' }

    let(:expected_aql) { '`foo`.`bar`' }

    it_should_behave_like 'Node#aql'
  end

  context 'with keyword names' do
    let(:target_name) { 'sort' }
    let(:attribute_name) { 'filter' }

    let(:expected_aql) { '`sort`.`filter`' }

    it_should_behave_like 'Node#aql'
  end

end
