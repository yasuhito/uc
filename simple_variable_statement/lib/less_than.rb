require 'boolean'

class LessThan < Struct.new(:left, :right)
  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      LessThan.new(left.reduce(environment), right)
    elsif right.reducible?
      LessThan.new(left, right.reduce(environment))
    else
      Boolean.new(left.value < right.value)
    end
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    "#{left} < #{right}"
  end
end
