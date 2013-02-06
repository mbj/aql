require 'spec_helper'

describe AQL::Buffer, '#append' do
  unless defined?(Encoding)
    before do
      pending "No support for encodings under #{Devtools.platform}"
    end
  end

  let(:object) { described_class.new    }
  subject      { object.append(content) }
  let(:utf8)   { Encoding::UTF_8        }

  this_spec = 'AQL::Bufffer#append'

  shared_examples_for this_spec do
    it 'should append content to buffer' do 
      expect { subject }.to change { object.content }.from('').to(expected_content)
    end

    it 'should return utf-8 encoded content' do
      subject.content.encoding.should be(utf8)
    end

    it_should_behave_like 'a command method'
  end

  context 'ascii encoded content' do
    let(:content)          { 'foo' }
    let(:expected_content) { 'foo'.encode('utf-8') }

    it_should_behave_like this_spec
  end

  context 'utf-8 encoded content' do
    let(:content)          { "\xC3\xBC".force_encoding(utf8) }
    let(:expected_content) { content.dup                     }

    it_should_behave_like this_spec
  end

  context 'with non utf-8 encodable content' do
    let(:content)          { "\xC3\x28" }

    it 'should raise error' do
      expect { subject }.to raise_error(Encoding::UndefinedConversionError, '"\xC3" from ASCII-8BIT to UTF-8')
    end
  end

end
