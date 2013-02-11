require 'spec_helper'

describe AQL, '.literal_node' do
  let(:object) { described_class }

  # Use this for similar macros
  def self.it_should_delegate_to(name, target)
    subject { object.public_send(name,*arguments) }

    let(:argument)  { mock('Argument') }
    let(:arguments) { [argument]       }
    let(:result)    { mock('Result')   }

    it "should delegate to #{target}" do
      target.should_receive(:new).with(*arguments).and_return(result)
      should be(result)
    end
  end

  it_should_delegate_to(:literal_node, AQL::Node::Literal)
end
