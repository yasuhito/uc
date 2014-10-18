require 'add'
require 'number'

describe Add do
  context 'without reducible subexpressions' do
    subject { Add.new(Number.new(1), Number.new(2)) }

    it { should be_reducible }
    it { should reduce_to Number.new(3) }
  end
end
