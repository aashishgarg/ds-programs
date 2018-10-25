require_relative '../stack/stack_with_linked_list.rb'
require_relative '../queue/queue_with_linked_list.rb'

class BinaryTreeNode
  attr_accessor :data, :first_child, :next_sibling

  def initialize(data)
    @data = data
    @first_child = nil
    @next_sibling = nil
  end
end

class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def create
    @root = BinaryTreeNode.new(1)
    @root.first_child = BinaryTreeNode.new(2)
    @root.first_child.next_sibling = BinaryTreeNode.new(3)
    @root.first_child.next_sibling.next_sibling = BinaryTreeNode.new(4)
    @root.first_child.next_sibling.next_sibling.first_child = BinaryTreeNode.new(5)
    @root.first_child.next_sibling.next_sibling.first_child.next_sibling = BinaryTreeNode.new(6)
    @root.first_child.next_sibling.next_sibling.first_child.next_sibling.next_sibling = BinaryTreeNode.new(7)
    @root
  end

  # Given a tree, give an algorithm for finding the sum of all the elements of the tree.
  def sum(root)
    return 0 if root.nil?
    root.data + sum(root.first_child) + sum(root.next_sibling)
  end


end