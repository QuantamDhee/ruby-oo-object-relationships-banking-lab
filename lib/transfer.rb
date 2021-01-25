class Transfer
  # your code here
  attr_reader :sender, :receiver 
  attr_accessor :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount 
  end

  def valid? 
    if sender.valid? && receiver.valid? 
      true
    end
  end

  def execute_transaction
    if valid? && @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount 
      @receiver.deposit(@amount)
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" 
      @status = "reversed"
      @sender.balance += @amount
      @receiver.balance -= @amount 
    end
  end
end
