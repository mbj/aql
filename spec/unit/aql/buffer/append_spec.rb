require 'spec_helper'

describe AQL::Buffer, '#append' do
  let(:object) { described_class.new }

  let(:content) { 'foo' }

  subject { object.append(content) }
  
  it 'should append content to buffer' do 
    expect { subject }.to change { object.content }.from('').to('foo')
  end

  it_should_behave_like 'a command method'
end
