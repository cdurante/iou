class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
     @transaction = Transaction.find(params[:id])
     if @transaction.update_attributes(params[:transaction].permit(:paid))
       flash[:success] = "You are all paid up!" 
     end
    redirect_to current_user
  end

  # POST /transactions
   def create
    @transaction = current_user.transactions.build(transaction_params)
    if @transaction.save
      flash[:notice] = "Transaction created"
    else
      flash[:error] = "Unable to create transaction."
    end
      redirect_to current_user
  end

  def show
    @user = User.find(params[:id])
  end



  # DELETE /transactions/1
  def destroy
   @transaction = current_user.transactions.find(params[:id])
    if @transaction.present?
     @transaction.destroy
      flash[:notice] = "Removed transaction."
    end
        redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_params

      params.require(:transaction).permit(:name, :amount, :debtor_id,:description)
    end
end
