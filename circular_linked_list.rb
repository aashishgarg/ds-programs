class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value)
    @value = value
    @next = nil
  end

  def to_s
    "Node with value: #{@value}"
  end
end

class CircularLinkedList
  
end
