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
  # after inserting an element in subtrees, the tree is returned to its parent. As a result, the complete tree will
  # get updated.
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

  # 1. First we need to find the location of the element which we want to delete.
  # 2. If the element to be deleted is a leaf node: return NULL to its parent.
  # 3. If the element to be deleted has one child: In this case we just need to send the current node’s child to its
  #    parent
  # 4. If the element to be deleted has both children: The general strategy is to replace the key of this node with the
  #    largest element of the left subtree and recursively delete that node (which is now empty). The largest node in the
  #    left subtree cannot have a right child
  def delete(root, data)
    return if root.nil?
    if data < root.data
      root.left = delete(root.left, data)
    elsif data > root.data
      root.right = delete(root.right, data)
    else
      # ----- node found ----- #
      if !root.left && !root.right
        root = nil
      elsif root.left && !root.right
        root = root.right
      elsif !root.left && root.right
        root = root.left
      else
        new_data = maximum(root.left).data
        root.data = new_data
        root.left = delete(root.left, root.data)
      end
    end
    root
  end

  # Problem -
  # 1. Given pointers to two nodes in a binary search tree, find the lowest common ancestor (LCA).
  # 2. Give an algorithm for finding the shortest path between two nodes in a BST.(It’s nothing but finding the LCA of
  #    two nodes in BST.)

  # The main idea of the solution is: while traversing BST from root to bottom, the first node we encounter with value
  # between α and β, i.e., α < node → data < β, is the Least Common Ancestor(LCA) of α and β (where α < β).
  # So just traverse the BST in pre-order, and if we find a node with value in between α and β,
  # then that node is the LCA. If its value is greater than both α and β, then the LCA lies on the left side of the node,
  # and if its value is smaller than both a and β, then the LCA lies on the right side.
  def lca(root, node1, node2)
    return root if root.nil?
    return root if node1 == root || node2 == root
    if node1.data < root.data && node2.data < root.data
      return lca(root.left, node1, node2)
    elsif node1.data > root.data && node2.data > root.data
      return lca(root.right, node1, node2)
    else
      return root
    end
  end

  # For each node, check if max value in left subtree is smaller than the current node data and min value in right
  # subtree greater than the node data.

  def bst?(root)
    return true if root.nil?
    return false if !root.left.nil? && (maximum(root.left).data > root.data)
    return false if !root.right.nil? && (minimum(root.right).data < root.data)
    return false if !bst?(root.left) || !bst?(root.right)
    true
  end
end