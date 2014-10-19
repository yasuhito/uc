require 'number'

class Multiply < Struct.new(:left, :right)
  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      Multiply.new(left.reduce(environment), right)
    elsif right.reducible?
      Multiply.new(left, right.reduce(environment))
    else
      Number.new(left.value * right.value)
    end
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    "#{left} * #{right}"
  end
end
