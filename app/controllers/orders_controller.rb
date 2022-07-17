class OrdersController < ApplicationController
    before_action :set_order, only: [:show]
    before_action :require_same_user, only: [:show]

    def create
        @sock = Sock.find(params[:sock_id])
        @order = Order.new(seller_id: @sock.user_id, buyer_id: params[:current_user_id], sock_id: @sock.id, price: @sock.price)
        if @order.save
            @sock.sold = true
            if @sock.save
                @sock.save
                flash[:success] = "Sock successfully purchased"
                redirect_to order_path(@order)
            end
        else
            puts(@order.errors.full_messages)
            redirect_to sock_path(@sock) 
        end
    end

    def show
        @order = Order.find(params[:id])
        @sock = Sock.find(@order.sock_id)
    end

    private

    def set_order
        @order = Order.find(params[:id])
    end

    def require_same_user
        if current_user.id != @order.buyer_id
          flash[:danger] = "Unable to perform that action"
          redirect_to root_path
        end
    end
end