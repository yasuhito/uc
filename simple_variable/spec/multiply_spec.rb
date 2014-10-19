require 'multiply'

describe Multiply do
  context 'without reducible subexpressions' do
    subject { Multiply.new(Number.new(2), Number.new(3)) }

    it { should be_reducible }
    it { should reduce_to Number.new(6) }
  end

  context 'with a reducible subexpression' do
    context 'on the left' do
      subject do
        Multiply.new(Multiply.new(Number.new(2), Number.new(3)), Number.new(4))
      end

      it { should be_reducible }
      it { should reduce_to Multiply.new(Number.new(6), Number.new(4)) }
    end

    context 'on the right' do
      subject do
        Multiply.new(Number.new(2), Multiply.new(Number.new(3), Number.new(4)))
      end

      it { should be_reducible }
      it { should reduce_to Multiply.new(Number.new(2), Number.new(12)) }
    end

    context 'on both sides' do
      subject do
        Multiply.new(Multiply.new(Number.new(2), Number.new(3)),
                     Multiply.new(Number.new(4), Number.new(5)))
      end

      it { should be_reducible }
      it do
        should reduce_to Multiply.new(Number.new(6),
                                      Multiply.new(Number.new(4),
                                                   Number.new(5)))
      end
    end
  end
end
