class Tree
  def initialize(arr)
    # @root = build_tree
  end

  def build_tree(arr)
    # and turns it into a balanced binary tree full of Node objects appropriately placed (don’t forget to sort and remove duplicates!).
    # return lv0 root node
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
end
