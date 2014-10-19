class Variable < Struct.new(:name)
  def reducible?
    true
  end

  def reduce(environment)
    environment[name]
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    name.to_s
  end
end
