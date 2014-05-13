class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  helper ProcessingHelper
  
  # GET /users
 def index
    @users = User.paginate(page: params[:page])
    @transaction = current_user.transactions.build if signed_in?
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    @transactions = @user.transactions.paginate(page: params[:page])
    @transaction = current_user.transactions.build if signed_in?
  end

  # GET /users/new
  def new
    if signed_in?
  redirect_to root_path
    else
      @user = User.new
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    if signed_in?
      redirect_to root_path
    else
      @user = User.new(user_params)   
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to IOU"
        redirect_to @user
      else
        flash[:error] = "Unable to add friend."
        render root_path
        
      end
    end
  end

  # PATCH/PUT /users/1
   def update
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    if current_user.admin? && User.find(params[:id])==current_user
      flash[:error] = "You cannot delete your own administrative account."
    else redirect_to @user
      User.find(params[:id]).destroy
      flash[:success] = "User deleted."
      redirect_to users_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

  def signed_in_user
     store_location
     redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
