require 'add'
require 'less_than'
require 'multiply'
require 'number'

describe LessThan do
  context 'without reducible subexpressions' do
    subject { LessThan.new(Number.new(1), Number.new(2)) }

    it { should be_reducible }
    it { should reduce_to Boolean.new(true) }
  end

  context 'with a reducible subexpression' do
    context 'on the left' do
      subject do
        LessThan.new(Add.new(Number.new(2), Number.new(3)), Number.new(4))
      end

      it { should be_reducible }
      it { should reduce_to LessThan.new(Number.new(5), Number.new(4)) }
    end

    context 'on the right' do
      subject do
        LessThan.new(Number.new(1), Add.new(Number.new(2), Number.new(3)))
      end

      it { should be_reducible }
      it { should reduce_to LessThan.new(Number.new(1), Number.new(5)) }
    end

    context 'on both sides' do
      subject do
        LessThan.new(Add.new(Number.new(1), Number.new(5)),
                     Multiply.new(Number.new(2), Number.new(3)))
      end

      it { should be_reducible }
      it do
        should reduce_to LessThan.new(Number.new(6),
                                      Multiply.new(Number.new(2),
                                                   Number.new(3)))
      end
    end
  end
end
