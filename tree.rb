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

  def insert(val, node = root)
    if node.nil?
      node = Node.new(val)
      return node
    end

    if val > node.data
      node.right = insert(val, node.right)
    elsif val < node.data
      node.left = insert(val, node.left)
    end
    node
  end

  def delete(val, node = root); end

  def find(val, node = root)
    return node if node.data == val || node.nil?

    if val > node.data
      find(val, node.right)
    elsif val < node.data
      find(val, node.left)
    end
  end
end

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
x = Tree.new(arr)
x.insert(12)
x.pretty_print
