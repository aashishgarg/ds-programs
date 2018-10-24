require_relative '../stack/stack_with_linked_list.rb'
require_relative '../queue/queue_with_linked_list.rb'

class QueueReversal
  attr_accessor :queue

  def initialize(queue)
    puts queue.print
    @stack = Stack.new
    @queue = queue
  end

  def reverse
    while !@queue.isEmpty?
      @stack.push(@queue.dequeue)
    end

    while !@stack.isEmpty?
      @queue.enqueue(@stack.pop)
    end
    
    puts @queue.print
    @queue
  end
end