require 'add'

describe Add do
  context 'without reducible subexpressions' do
    subject { Add.new(Number.new(1), Number.new(2)) }

    it { should be_reducible }
    it { should reduce_to Number.new(3) }
  end

  context 'with a reducible subexpression' do
    context 'on the left' do
      subject { Add.new(Add.new(Number.new(1), Number.new(2)), Number.new(3)) }

      it { should be_reducible }
      it { should reduce_to Add.new(Number.new(3), Number.new(3)) }
    end

    context 'on the right' do
      subject { Add.new(Number.new(1), Add.new(Number.new(2), Number.new(3))) }

      it { should be_reducible }
      it { should reduce_to Add.new(Number.new(1), Number.new(5)) }
    end

    context 'on both sides' do
      subject do
        Add.new(Add.new(Number.new(1), Number.new(2)),
                Add.new(Number.new(3), Number.new(4)))
      end

      it { should be_reducible }
      it do
        should reduce_to Add.new(Number.new(3),
                                 Add.new(Number.new(3), Number.new(4)))
      end
    end
  end
end
