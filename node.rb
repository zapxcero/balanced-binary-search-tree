class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data)
    self.data = data
  end

  def <=>(other)
    data <=> other.data
  end
end
