class Queue
    def initialize
      @items = []
    end
  
    def enqueue(obj)
      @items << obj
    end
  
    def dequeue
      @items.shift
    end
  
    def is_empty?
      @items.empty?
    end
  end
  