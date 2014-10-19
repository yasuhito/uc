class Boolean < Struct.new(:value)
  def reducible?
    false
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    value.to_s
  end
end
