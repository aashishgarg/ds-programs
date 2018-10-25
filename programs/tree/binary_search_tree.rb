class BinarySearchTreeNode
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def create
    @root = BinarySearchTreeNode.new(8)
    @root.left, @root.right = BinarySearchTreeNode.new(3), BinarySearchTreeNode.new(10)
    @root.left.left, @root.left.right = BinarySearchTreeNode.new(1), BinarySearchTreeNode.new(6)
    @root.left.right.left, @root.left.right.right = BinarySearchTreeNode.new(4), BinarySearchTreeNode.new(7)
    @root.right.right = BinarySearchTreeNode.new(14)
    @root.right.right.left = BinarySearchTreeNode.new(13)
    @root
  end

  # Search with recursion
  # Time Complexity: O(n), in worst case (when the given binary search tree is a skew tree).
  # Space Complexity: O(n), for recursive stack.
  def search(root, data)
    return unless root
    if data < root.data
      return search(root.left, data)
    elsif data > root.data
      return search(root.right, data)
    else
      return root
    end
    nil
  end

  # Search without recursion
  def search_without_recursion(root, data)
    return nil if root.nil?
    while !root.nil?
      if data == root.data
        return root
      elsif data < root.data
        root = root.left
      else
        root = root.right
      end
    end
    nil
  end

  # Finding Minimum Element in Binary Search Trees with recursion
  # In BSTs, the minimum element is the left-most node, which does not have left child.
  def minimum(root)
    return nil if root.nil?
    return root if root.left.nil?
    minimum(root.left)
  end

  # Finding Minimum Element in Binary Search Trees without recursion
  def minimum_without_recursion(root)
    return nil if root.nil?
    while root = root.left
      return root if root.left.nil?
    end
  end

  # Finding Maximum Element in Binary Search Trees with recursion
  # In BSTs, the maximum element is the right-most node, which does not have right child.
  def maximum(root)
    return nil if root.nil?
    return root if root.right.nil?
    maximum(root.right)
  end

  # Finding Maximum Element in Binary Search Trees without recursion
  def maximum_without_recursion(root)
    return nil if root.nil?
    while root = root.right
      return root if root.right.nil?
    end
  end

  # To insert data into binary search tree, first we need to find the location for that element without recursion.
  def insert(root, data)
    if root.nil?
      root = BinarySearchTreeNode.new(data)
      root.left, root.right = nil, nil
    else
      if data < root.data
        root.left = insert(root.left, data)
      elsif data > root.data
        root.right = insert(root.right, data)
      end
    end
    root
  end

  # To insert data into binary search tree, first we need to find the location for that element with recursion.
  def insert_without_recursion(root, data)
    if root.nil?
      root = BinarySearchTreeNode.new(data)
      root.left, root.right = nil, nil
    else
      
    end
    root
  end
end