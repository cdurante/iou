class TransactionsController < ApplicationController
  before_action :signed_in_user

  def create
    @transaction = current_user.transactions.build(:collector_id => params[:collector].id,:debtor_id => params[:debtor].id, :name => params[:name], :amount => params[:amount])
    if @transaction.save
      flash[:success] = "Transaction created"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def transaction_params
      params.require(:transaction).permit(:content, :amount, :debtor)
    end
end
