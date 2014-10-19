class Assign < Struct.new(:name, :expression)
  def reducible?
    true
  end

  def reduce(environment)
    if expression.reducible?
      [Assign.new(name, expression.reduce(environment)),
       environment]
    else
      [DoNothing.new, environment.merge(name => expression)]
    end
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    "#{name} = #{expression}"
  end
end
