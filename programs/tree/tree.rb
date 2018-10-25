require_relative '../stack/stack_with_linked_list.rb'
require '/home/ashish/workspace/personal/ds-programs/programs/queue/queue_with_linked_list.rb'

class BinaryTreeNode
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    left = nil
    right = nil
  end
end

class BinaryTree
  attr_accessor :root

  def create
    @root = BinaryTreeNode.new(1)
    @root.left, @root.right = BinaryTreeNode.new(2), BinaryTreeNode.new(3)
    @root.left.left, @root.left.right = BinaryTreeNode.new(4), BinaryTreeNode.new(5)
    @root.right.left, @root.right.right = BinaryTreeNode.new(6), BinaryTreeNode.new(7)
    @root.left.left.left, @root.left.left.right = BinaryTreeNode.new(8), BinaryTreeNode.new(9)
    @root.left.right.left, @root.left.right.right = BinaryTreeNode.new(10), BinaryTreeNode.new(11)
    @root.left.left.right.left, @root.left.left.right.right = BinaryTreeNode.new(12), BinaryTreeNode.new(13)
  end

  def preOrder(root)
    if root
      puts root.data
      preOrder(root.left)
      preOrder(root.right)
    end
  end

  def inOrder(root)
    if root
      inOrder(root.left)
      puts root.data
      inOrder(root.right)
    end
  end

  def postOrder(root)
    if root
      postOrder(root.left)
      postOrder(root.right)
      puts root.data
    end
  end

  def preOrderWithIteration(root)
    arr = []
    return arr unless root
    stack = Stack.new
    stack.push(root)
    while stack.length != 0
      temp = stack.pop
      arr << temp.data
      if temp.right
        stack.push(temp.right)
      end

      if temp.left
        stack.push(temp.left)
      end
    end
    arr
  end

  def inOrderWithIteration(root)
    arr = []
    stack = Stack.new
    current = root
    done = false
    while (!done)
      if current
        stack.push(current)
        current = current.left
      else
        if stack.length == 0
          done = true
        else
          current = stack.pop
          arr << current.data
          current = current.right
        end
      end
    end
    arr
  end

  def levelOrderTraversal
    puts 'Queue id empty' and return if @root.nil?
    q = QueueWithLinkedList.new
    q.enqueue(@root)

    while !q.isEmpty?
      node = q.dequeue
      print "#{node.data} "
      q.enqueue(node.left) if node.left
      q.enqueue(node.right) if node.right
    end
  end

  # Give an algorithm for finding maximum element in binary tree with recursion.
  def maxInBinaryTree(root)
    max = 0
    if root
      leftMax = maxInBinaryTree(root.left)
      rightMax = maxInBinaryTree(root.right)
      if leftMax > rightMax
        max = leftMax
      else
        max = rightMax
      end
      if root.data > max
        max = root.data
      end
    end
    max
  end

  # Give an algorithm for finding maximum element in binary tree without recursion.
  def max
    puts 'Queue id empty' and return if @root.nil?
    q = QueueWithLinkedList.new
    q.enqueue(@root)
    max = 0
    while !q.isEmpty?
      node = q.dequeue
      max = node.data if node.data > max
      q.enqueue(node.left) if node.left
      q.enqueue(node.right) if node.right
    end
    return max
  end

  # Give an algorithm for searching an element in binary tree.
  def find(root, data)
    return false unless root
    return root if root.data == data
    return find(root.left, data) || find(root.right, data)
  end

  # Give an algorithm for searching an element in binary tree without recursion.
  def find_without_recursion(data)
    puts 'Tree is empty' and return if @root.nil?
    q = QueueWithLinkedList.new
    q.enqueue(@root)
    found = false
    while !q.isEmpty?
      node = q.dequeue
      found = true if node.data == data
      q.enqueue(node.left) if node.left
      q.enqueue(node.right) if node.right
    end
    return found
  end

  # Give an algorithm for inserting an element into binary tree.
  def insert(data)
    puts 'Queue id empty' and return if @root.nil?
    q = QueueWithLinkedList.new
    q.enqueue(@root)
    while !q.isEmpty?
      node = q.dequeue
      if node.left
        q.enqueue(node.left)
      else
        node.left = BinaryTreeNode.new(data)
        puts "Node entered to the left of #{node.data}"
        return
      end

      if node.right
        q.enqueue(node.right)
      else
        node.right = BinaryTreeNode.new(data)
        puts "Node entered to the right of #{node.data}"
        return
      end
    end
  end

  # Give an algorithm for finding the size of binary tree with recursion.
  def size(root)
    leftCount = root.left ? size(root.left) : 0
    rightCount = root.right ? size(root.right) : 0
    return 1 + leftCount + rightCount
  end

  # Give an algorithm for finding the size of binary tree without recursion.
  def size_without_recursion
    count = 0
    return 0 unless @root
    q = QueueWithLinkedList.new
    q.enqueue(@root)
    while !q.isEmpty?
      node = q.dequeue
      count += 1
      q.enqueue(node.left) if node.left
      q.enqueue(node.right) if node.right
    end
    count
  end

  # Give an algorithm for deleting the tree.
  # To delete a tree, we must traverse all the nodes of the tree and delete them one by one.
  # Before deleting the parent node we should delete its children nodes first.
  def delete_tree
    @root = nil # In ruby it will be taken care by garbage collector
  end

  # Give an algorithm for finding the height (or depth) of the binary tree.
  # Depth of the binary tree is the length of the longest path from this node to a leaf. 
  # Depth of the binary tree with no descendents is zero.
  def height_with_recursion(root)
    return 0 unless root
    leftDepth = height_with_recursion(root.left)
    rightDepth = height_with_recursion(root.right)
    (leftDepth > rightDepth) ? leftDepth + 1 : rightDepth + 1
  end

  def min_height
    return 0 unless @root
    q = QueueWithLinkedList.new
    q.enqueue(@root)
    q.enqueue(nil)
    height = 1
    while !q.isEmpty?
      node = q.dequeue
      if node
        puts "--- #{node.data} -----#{height}------"
        return height if (!node.left && !node.right)
        q.enqueue(node.left) if node.left
        q.enqueue(node.right) if node.right
      else
        height += 1
        q.enqueue(nil)
      end
    end
    height
  end

  def deepest_node(root)
    if root.nil?
      puts 'Empty Tree'
      return
    end
    q = QueueWithLinkedList.new
    q.enqueue(root)
    node = root
    while !q.isEmpty?
      node = q.dequeue
      q.enqueue(node.left) if node.left
      q.enqueue(node.right) if node.right
    end
    node
  end

  # Give an algorithm for deleting an element (assuming data is given) from binary tree
  # Solution: The deletion of a node in binary tree can be implemented as
  # 1. Starting at root, find the node which we want to delete.
  # 2. Find the deepest node in the tree.
  # 3. Replace the deepest node’s data with node to be deleted.
  # 4. Then delete the deepest node.
  def delete(data)
    node = find(@root, data)
    remove_node(node) if node
  end

  def remove_node(node)
    parent = parent(node.data)
    if !node.left && !node.right
      parent.left = nil if parent.left == node
      parent.right = nil if parent.right == node
    elsif !node.left && node.right
      parent.left = node.right if parent.left == node
      parent.right = node.right if parent.right == node
    elsif node.left && !node.right
      parent.left = node.left if parent.left == node
      parent.right = node.left if parent.right == node
    else
      deepest_node = deepest_node(node)
      deepest_node_parent = parent(deepest_node.data)
      node.data = deepest_node.data
      deepest_node_parent.left = nil if deepest_node_parent.left == deepest_node
      deepest_node_parent.right = nil if deepest_node_parent.right == deepest_node
    end
  end

  def parent(data)
    puts 'Tree is empty' and return if @root.nil?
    q = QueueWithLinkedList.new
    q.enqueue(@root)
    puts 'Root Node provided' and return if @root.data == data
    while !q.isEmpty?
      node = q.dequeue
      parent = node if (node.left&.data == data || node.right&.data == data)
      return parent if parent
      q.enqueue(node.left) if node.left
      q.enqueue(node.right) if node.right
    end
  end

  # Give an algorithm for finding the number of leaves in the binary tree without using recursion
  def leaves_count(root)
    if root.nil?
      puts 'Empty tree'
      return
    end
    return 1 if (!root.left && !root.right)
    leaves_count = 0
    queue = QueueWithLinkedList.new
    queue.enqueue(root)
    while !queue.isEmpty?
      node = queue.dequeue
      leaves_count += 1 if !node.left && !node.right
      queue.enqueue(node.left) if node.left
      queue.enqueue(node.right) if node.right
    end
    leaves_count
  end

  # Give an algorithm for finding the number of full nodes in the binary tree without using recursion.
  def full_nodes_count(root)
    if root.nil?
      puts 'Empty tree'
      return
    end
    full_nodes_count = 0
    queue = QueueWithLinkedList.new
    queue.enqueue(root)
    while !queue.isEmpty?
      node = queue.dequeue
      full_nodes_count += 1 if node.left && node.right
      queue.enqueue(node.left) if node.left
      queue.enqueue(node.right) if node.right
    end
    full_nodes_count
  end

  # Give an algorithm for finding the number of half nodes (nodes with only one child) in the binary tree
  # without using recursion.
  def half_nodes_count(root)
    if root.nil?
      puts 'Empty tree'
      return
    end
    half_nodes_count = 0
    queue = QueueWithLinkedList.new
    queue.enqueue(root)
    while !queue.isEmpty?
      node = queue.dequeue
      half_nodes_count += 1 if ((node.left && !node.right) || (!node.left && node.right))
      queue.enqueue(node.left) if node.left
      queue.enqueue(node.right) if node.right
    end
    half_nodes_count
  end


end
