require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    return nil if arr.empty?

    first = 0
    last = arr.length - 1
    root = (first + last) / 2

    arr[root].left_child = build_tree(arr.slice(first, root))
    arr[root].right_child = build_tree(arr.slice(root + 1, last))
    arr[root]
  end

  def insert(val); end

  def delete(val)
    # (you’ll have to deal with several cases for delete such as when a node has children or not)
  end

  def find(val)
    # accepts a value and returns the node with the given value.
  end

  def level_order
    # level_order method which accepts a block.
    # traverse the tree in breadth-first level order and yield each node to the provided block.
    # return an array of values if no block is given
    # Tip: You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to traverse and to add new ones to the list (as you saw in the video).
  end

  def inorder
    # accepts a block.
  end

  def preorder
    # accepts a block.
  end

  def postordere
    # accepts a block.
  end
  # Each method should traverse the tree in their respective depth-first order and yield each node to the provided block.
  # return an array of values if no block is given.

  def height(node)
    # which accepts a node and returns its height.
    # Height is defined as the number of edges in longest path from a given node to a leaf node.
  end

  def depth(node)
    # accepts a node and returns its depth.
    # Depth is defined as the number of edges in path from a given node to the tree’s root node.
  end

  def balanced?
    # checks if the tree is balanced.
    # A balanced tree is one where the difference between heights of left subtree and right subtree of every node is not more than 1.
  end

  def rebalance
    # rebalances an unbalanced tree.
    # You’ll want to use a traversal method to provide a new array to the #build_tree method.
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end

node1 = Node.new
node1.data = 1
node2 = Node.new
node2.data = 2
node3 = Node.new
node3.data = 3
node4 = Node.new
node4.data = 4
node5 = Node.new
node5.data = 5
node6 = Node.new
node6.data = 6
node7 = Node.new
node7.data = 7
node8 = Node.new
node8.data = 8
node9 = Node.new
node9.data = 9

arr = [node1, node2, node3, node4, node5, node6, node7, node8, node9]
x = Tree.new(arr)
x.pretty_print
