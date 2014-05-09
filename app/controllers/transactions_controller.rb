class TransactionsController < ApplicationController

  def new
    @transaction = current_user.transactions.build if signed_in?
  end 

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
   @transaction = current_user.transactions.find(params[:id])
    if @transaction.present?
     @transaction.destroy
      flash[:notice] = "Removed transaction."
    end
    redirect_to current_user
  end

  private

    def transaction_params
      params.require(:transaction).permit(:content, :amount, :debtor)
    end
end
