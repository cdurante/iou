class TransactionsController < ApplicationController


  def create
    @transaction = current_user.transactions.build(:debtor_id => params[:debtor].id, :name => params[:name], :amount => params[:amount], :paid => false)
    if @transaction.save
      flash[:notice] = "Transaction created"
    else
      flash[:error] = "Unable to create transaction."
      redirect_to root_url
    end
  end

  def destroy
    @transaction.destroy
    flash[:notice] = "Removed transaction."
    redirect_to current_user
  end

  private

    def transaction_params
      params.require(:transaction).permit(:content, :amount, :debtor)
    end
end
