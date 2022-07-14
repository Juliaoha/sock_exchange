class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy, :show]
    
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
        redirect_to root_path
      else
        render 'new'
      end
    end
    
    def edit
    end
    
    def update
      if @user.update(user_params)
        flash[:success] = "Your account was updated successfully"
        redirect_to @user
      else
        render 'edit'
      end
    end
    
    def show
      @user_socks = @user.socks
      @user_orders = @user.orders
    end
    
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:danger] = "User and all articles created by user have been deleted"
      redirect_to users_path
    end
    
    private
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:username, :email, :password)  
    end
    
    def require_same_user
      if current_user != @user
        flash[:danger] = "You can only edit your own account"
        redirect_to root_path
      end
    end
  end