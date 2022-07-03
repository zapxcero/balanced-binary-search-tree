class Node
  include Comparable
  def initialize
    @data = nil
    @left_child = nil
    @right_child = nil
  end

  def <=>(other)
    # str.size <=> other.str.size
  end
end
