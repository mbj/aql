module AQLHelper
  def compress_aql(string)
    string.gsub(/^[ ]*/, '').split("\n").join(' ')
  end

  def expect_aql(string)
    expected_aql = compress_aql(string)
    subject { object.aql }
    it_should_behave_like 'an idempotent method'
    it { should eql(expected_aql) }
  end
end
