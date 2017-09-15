element = [1,2,3,4]

module Enumerable
  def my_each
    for element in self
      yield(element)
    end
      self
  end
end
