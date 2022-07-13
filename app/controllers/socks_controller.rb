class SocksController < ApplicationController
  before_action :set_sock, only: [:edit, :update, :show, :destroy]
  # before_action :require_user, except: [:index, :show]
  # before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
      @socks = Sock.all
  end
    
  def new
      @sock = Sock.new
  end
  
  def create
      @sock = Sock.new(sock_params)
      # @sock.user = current_user
      if @sock.save
        flash[:success] = "Sock was listed successfully"
        redirect_to sock_path(@sock)
      else
        puts(@sock.errors.full_messages)
        render 'new'
      end
  end

  def update
      if @sock.update(sock_params)
        flash[:success] = "Sock was successfully updated"
        redirect_to sock_path(@sock)
      else
        render 'edit'
      end
  end

  def show
  end

  def edit
  end

  def destroy
      @sock.destroy
      flash[:danger] = "Sock was successfully deleted"
      redirect_to root_path
  end

  private

  def set_sock
      @sock = Sock.find(params[:id])
  end

  def sock_params
      params.require(:sock).permit(:title, :description, :size, :brand, :price, :foot, :colour, :quality)
  end
end