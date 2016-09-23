# class MyQueue
#   def initialize
#     @store = []
#   end
#
#   def enqueue(n)
#     @store.unshift(n)
#   end
#
#   def dequeue
#     @store.pop
#   end
#
#   def peek
#     @store.last
#   end
#
#   def size
#     @store.length
#   end
#
#   def empty?
#     @store.empty?
#   end
# end

class MyStack
  attr_accessor :max, :min
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    @store.pop
  end

  def push(n)
    @store.push(n)
    @max = n if @max.nil? || n > @max
    @min = n if @min.nil? || n < @min
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.last
  end
end

class StackQueue
  def initialize
    @reverse_stack = MyStack.new
    @real_stack = MyStack.new
  end

  def enqueue(n)
    @real_stack.push(n)
  end

  def dequeue
    @real_stack.size.times do
      @reverse_stack.push(@real_stack.pop)
    end
    result = @reverse_stack.pop
    @real_stack.max = nil
    @real_stack.min = nil
    @reverse_stack.size.times do
      @real_stack.push(@reverse_stack.pop)
    end
    result
  end

  def size
    @real_stack.size
  end

  def empty?
    @real_stack.size == 0
  end

  def max
    @real_stack.max
  end

  def min
    @real_stack.min
  end
end
