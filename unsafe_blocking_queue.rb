class UnsafeBlockingQueue
  attr_reader :storage

  def initialize
    @storage = Array.new
  end

  def push(item)
    puts "pushed...."
    @storage.push(item)
  end

  def pop
    @storage.shift
  end
end

ubq = UnsafeBlockingQueue.new

5.times.map do
  Thread.new do
    if ubq.storage.size < 3
      ubq.push("new item")
    end
  end
end.each(&:join)
