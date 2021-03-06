module ProcessingHelper
  
def monthly_receivable(user)
  monthly_receivable = 0.0
	 if user.transactions.any?
  	 	for transaction in user.transactions
  	 	  monthly_receivable += transaction.amount.to_f
  	 	end
  	end
    monthly_receivable
  end

  def monthly_received(user)
    monthly_received = 0.0
  	if user.transactions.any?
  	 	for transaction in user.transactions
  	 		if transaction.paid?
  	 			monthly_received += transaction.amount.to_f
  	 		end
  	 	end
  	end
    monthly_received
  end


  def monthly_payable(user)
    monthly_payable = 0.0
  	if user.inverse_transactions.any?
  		for transaction in user.inverse_transactions
  			monthly_payable += transaction.amount.to_f
  		end
  	end
    monthly_payable
  end


  def monthly_paid(user)
    monthly_paid = 0.0
  	if user.inverse_transactions.any?
  		for transaction in user.inverse_transactions
  			if transaction.paid?
  				monthly_paid += transaction.amount.to_f
  			end
  		end
  	end
    monthly_paid
  end
end
