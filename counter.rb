require 'thread'

class Counter
  def initialize
    @counter = 0
    @mutex = Mutex.new
  end

  def increment
    @mutex.synchronize do
      @count += 1
    end
  end
end

$counter = Counter.new
