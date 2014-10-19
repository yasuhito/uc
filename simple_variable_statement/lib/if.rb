class If < Struct.new(:condition, :consequence, :alternative)
  def reducible?
    true
  end

  def reduce(environment)
    if condition.reducible?
      [If.new(condition.reduce(environment), consequence, alternative),
       environment]
    else
      case condition
      when Boolean.new(true)
        [consequence, environment]
      when Boolean.new(false)
        [alternative, environment]
      end
    end
  end

  def inspect
    "<<#{self}>>"
  end

  def to_s
    "if (#{condition}) { #{consequence} } else { #{alternative} }"
  end
end
