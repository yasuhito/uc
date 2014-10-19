class DoNothing
  def reducible?
    false
  end

  def ==(other)
    other.instance_of?(DoNothing)
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    'do-nothing'
  end
end
