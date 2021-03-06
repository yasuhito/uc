$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')

RSpec::Matchers.define :reduce_to do |expected|
  match do |subject|
    actual(subject) == expected
  end

  def actual(subject)
    subject.reduce(environment)
  end

  def environment
    @environment || {}
  end

  chain :within do |environment|
    @environment = environment
  end

  failure_message do |subject|
    "expected that #{subject.inspect} would reduce to #{expected.inspect}"\
    " within #{environment.inspect},"\
    " but it reduces to #{actual(subject).inspect}"
  end
end
