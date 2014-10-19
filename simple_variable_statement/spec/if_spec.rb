require 'if'

describe If do
  let(:environment) { { x: Number.new(1), y: Number.new(2) } }

  context 'without a reducible subexpression' do
    subject do
      If.new(Boolean.new(false),
             Assign.new(:x, Number.new(3)),
             Assign.new(:y, Number.new(3)))
    end

    it { should be_reducible }
    it do
      should
      reduce_to([Assign.new(:y, Number.new(3)), environment])
        .within(environment)
    end
  end

  context 'with a reducible subexpression' do
    subject do
      If.new(LessThan.new(Number.new(3), Number.new(4)),
             Assign.new(:x, Number.new(3)),
             Assign.new(:y, Number.new(3)))
    end

    it { should be_reducible }
    it do
      should
      reduce_to([If.new(Boolean.new(true),
                        Assign.new(:x, Number.new(3)),
                        Assign.new(:y, Number.new(3))),
                 environment])
        .within(environment)
    end
  end
end
