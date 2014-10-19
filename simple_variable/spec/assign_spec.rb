require 'Assign'

describe Assign do
  let(:environment) { { x: Number.new(1), y: Number.new(2) } }

  context 'without a reducible subexpression' do
    subject { Assign.new(:x, Number.new(5)) }

    it { should be_reducible }
    it do
      should
      reduce_to([DoNothing.new,
                 { x: Number.new(5), y: Number.new(2) }]).within(environment)
    end
  end

  context 'with a reducible subexpression' do
    subject { Assign.new(:x, Add.new(Number.new(2), Number.new(3))) }

    it { should be_reducible }
    it do
      should
      reduce_to([Assign.new(:x, Number.new(5)), environment])
        .within(environment)
    end
  end
end
