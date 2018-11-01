#                     ________________
# Example Max Heap - |17|13|6|1|4|2|5|
#                    -----------------
# Heap is a complete binary tree where all leaf nodes are at height h or h-1.
# Max no. of elements - This is because, to get maximum nodes, we need to fill all the h levels completely and the
#                       maximum number of nodes is nothing but the sum of all nodes at all h levels [2**(h+1) – 1].
# Min no. of elements - To get minimum nodes, we should fill the h – 1 levels fully and the last level with only one
#                       element. Hence minimum number of nodes is nothing but the sum of all nodes
#                       from h – 1 levels plus 1 => [(2**h)].
class Heap
  attr_accessor :heap_type, :count, :capacity, :array

  def initialize(capacity, heap_type)
    @capacity = capacity
    @heap_type = heap_type
    @array = Array.new(capacity)
    @count = @array.size
  end

  def count
    @array.size
  end

  def create
    @array = [31, 10, 21, 9, 8, 12, 18, 3, 2, 1, 7]
    @count = @array.size
    @array
  end

  def create_invalid
    @array = [31, 1, 21, 9, 10, 12, 18, 3, 2, 8, 7]
    @count = @array.size
    @array
  end

  # For a node at ith location, its parent is at (i-1)/2 location
  def parent(node_index)
    return -1 if (node_index < 0) || (node_index > @count)
    return (node_index - 1)/2
  end

  # for a node at ith location, its children are at (2 * i + 1) and (2 * i + 2) locations
  # left child location - (2 * i + 1)
  def left_child(parent_index)
    left = 2 * parent_index + 1
    return -1 if left > (@array.size - 1)
    left
  end

  # right child location - (2 * i + 2)
  def right_child(parent_index)
    right = 2 * parent_index + 2
    return -1 if right > (@array.size - 1)
    right
  end

  # Getting the Maximum Element
  # Since the maximum element in max heap is always at root, it will be stored at this.array[0].
  def max
    return -1 if @count == 0
    return @array[0]
  end

  # Heapifying(Insertion in Heap) an Element
  # After inserting an element into heap, it may not satisfy the heap property. In that case we need to adjust the
  # locations of the heap to make it heap again. This process is called heapifying.
  # we have to find the maximum of its children and swap it with the current element and continue this process
  # until the heap property is satisfied at every node.
  # Heaping the element at location i
  def percolate_down(i)
    sorted = false
    left, right = left_child(i), right_child(i)
    max = ((left != -1) && (@array[left] > @array[i])) ? left : i
    max = right if ((right != -1) && (@array[right] > @array[max]))
    if max == i
      sorted = true
    else
      @array[max], @array[i] = @array[i], @array[max]
    end
    percolate_down(max) if (sorted == false) && (i >= 0)
    @array
  end

  # Deleting an Element
  # To delete an element from heap, we just need to delete the element from the root. This is the only operation
  # (maximum element) supported by standard heap. After deleting the root element, copy the last element of the
  # heap (tree) and delete that last element.
  # After replacing the last element, the tree may not satisfy the heap property. To make it heap again, call the
  # PercolateDown function.
  def delete_max
    return -1 if @count == 0
    data = @array[0]
    @array[0] = @array.pop
    @count = @array.size
    percolate_down(0)
    data
  end

  # Inserting an Element
  # Insertion of an element is similar to the heapify and deletion process -
  # 1 Increase the heap size
  # 2 Keep the new element at the end of the heap (tree)
  # 3 Heapify the element from bottom to top (root)
  def insert(data)
    @array << data
    i = @array.size - 1
    while (i >= 0) && (data > @array[(i -1)/2])
      @array[(i -1)/2], @array[i] = @array[i], @array[(i -1)/2]
      i = parent(i)
    end
    @array
  end

  # Destroy a heap
  def destroy_heap
    @array = nil
    @count = 0
  end

  # Build a heap from a random array
  # Leaf nodes always satisfy the heap property and do not need to care for them. The leaf elements are always at the
  # end and to heapify the given array it should be enough if we heapify the non-leaf nodes. Now let us concentrate on
  # finding the first non-leaf node. The last element of the heap is at location h → count – 1, and to find the first
  # non-leaf node it is enough to find the parent of the last element.
  def build_heap(array)
    @array = array
    last = @array.size - 1
    ((last - 1)/2).downto(0).each do |i|
      percolate_down(i)
    end
    self
  end

  # One main application of heap ADT is sorting (heap sort). The heap sort algorithm inserts all elements
  # (from an unsorted array) into a heap, then removes them from the root of a heap until the heap is empty.
  def heap_sort(array)
    @array = array
    heap = build_heap(@array)
    sorted = []
    (0..(@array.size - 1)).each do |i|
      sorted << heap.delete_max
    end
    sorted
  end
end
