require_relative '../programs/linked_list/singly_linked_list.rb'

class QueueWithLinkedList
    attr_accessor :front, :rear, :length, :linked_list
    
    def initialize
      @length = 0
      @rear = nil
      @front = nil
      @linked_list = LinkedList.new
    end
  
    def enqueue(data)
      node = Node.new(data)
      @linked_list.append(data)
      if @linked_list.size == 1
        @front = node
      else
        @rear = node    
      end
      @length += 1
    end
  
    def dequeue
      if @linked_list.size == 0
        raise 'Underflow'
      else
        data = @front.value      
        @linked_list.delete(data)
        @front = @linked_list.head
        @length -= 1
        if @length == 0
          @rear = nil
        end      
        data
      end
    end
  
    def print
      @linked_list.print
    end  
  end