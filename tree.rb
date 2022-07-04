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

  def delete(val, node = root)
    return node if node.nil?

    if val > node.data
      node.right = delete(val, node.right)
    elsif val < node.data
      node.left = delete(val, node.left)
    else
      if node.left.nil?
        temp = node.right
        node = nil
        return temp
      elsif node.right.nil?
        temp = node.left
        node = nil
        return temp
      end
      temp = min_node(node.right)
      node.data = temp.data
      node.right = delete(temp.data, node.right)
    end
    node
  end

  def find(val, node = root)
    return node if node.data == val || node.nil?

    if val > node.data
      find(val, node.right)
    elsif val < node.data
      find(val, node.left)
    end
  end

  def min_node(node = root)
    current_node = node
    current_node = current_node.left until current_node.left.nil?
    current_node
  end

  def level_order(queue = [root], _nodes = [], &blk)
    return if queue.empty?

    node = queue.shift
    blk.call(node.data)
    queue.append node.left unless node.left.nil?
    queue.append node.right unless node.right.nil?
    level_order(queue, &blk)
  end
end

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
x = Tree.new(arr)
x.pretty_print
x.level_order { |data| puts data }
