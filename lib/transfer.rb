class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver
  
  @@transaction_hist = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    sender.balance -= @amount
    
    if valid?
      
      receiver.deposit(@amount)
      @status = "complete"
      @amount = 0
    else
      sender.balance += @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if status == "complete"
      
    end
  end
end
