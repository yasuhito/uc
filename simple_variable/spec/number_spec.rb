require 'number'

describe Number do
  subject { Number.new(42) }

  it { should_not be_reducible }
end
