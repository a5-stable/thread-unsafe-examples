# This class represents an ecommerce order
class UnsafeOrder
  attr_accessor :amount, :status

  def initialize(amount, status)
    @amount = amount
    @status = status
  end

  def pending?
    status == "pending"
  end

  def collect_payment
    puts "Collecting payment..."
    self.status = 'paid'
  end
end

# Create a pending order for $100
order = UnsafeOrder.new(100.00, 'pending')

# Ask 5 threads to check the status, and collect
# payment if it's 'pending'
5.times.map do
  Thread.new do
    if order.pending?
      order.collect_payment
    end
  end
end.each(&:join)
