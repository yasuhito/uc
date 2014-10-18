require 'boolean'

describe Boolean do
  describe 'true' do
    subject { Boolean.new(true) }

    it { should_not be_reducible }
  end

  describe 'false' do
    subject { Boolean.new(false) }

    it { should_not be_reducible }
  end
end
