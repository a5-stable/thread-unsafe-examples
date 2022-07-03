class BlockingQueue
  attr_reader :storage

  def initialize
    @storage = Array.new
    @mutex = Mutex.new
    @condvar = ConditionVariable.new
  end

  def push(item)
    puts "pushing..."
    @mutex.synchronize do
      @storage.push(item)
      @condvar.signal
    end
  end

  def pop
    @mutex.synchronize do
      while @storage.empty?
        @condvar.wait(@mutex)
      end

      @storage.shift
    end
  end
end
# https://github.com/ruby/ruby/blob/ruby_1_9_3/lib/thread.rb#L140
