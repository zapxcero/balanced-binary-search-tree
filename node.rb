class Node
  include Comparable
  attr_accessor :data, :left_child, :right_child

  def <=>(other)
    data <=> other.data
  end
end
