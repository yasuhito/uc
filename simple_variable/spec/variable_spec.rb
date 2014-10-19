require 'variable'

describe Variable do
  subject { Variable.new(:x) }
  let(:value) { double }
  let(:environment) { { x: value } }

  it { should be_reducible }
  it { should reduce_to(value).within(environment) }
end
