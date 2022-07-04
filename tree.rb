require_relative 'node'

class Tree
  attr_accessor :root, :arr

  def initialize(arr)
    @arr = to_node(arr)
    @root = build_tree(@arr)
  end

  def to_node(arr)
    arr = arr.uniq!.sort
    arr_node = []
    arr.each do |el|
      arr_node.push(Node.new(el))
    end
    arr_node
  end

  def build_tree(arr)
    return nil if arr.empty?

    first = 0
    last = arr.length - 1
    root = (first + last) / 2

    arr[root].left = build_tree(arr.slice(first, root))
    arr[root].right = build_tree(arr.slice(root + 1, last))
    arr[root]
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(val, base = root); end

  def find(val, base = root)
    return base if base.data == val || base.nil?

    if val > base.data
      find(val, base.right)
    elsif val < base.data
      find(val, base.left)
    end
  end
end

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
x = Tree.new(arr)
x.pretty_print
