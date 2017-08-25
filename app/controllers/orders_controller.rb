class OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find params[:id]
  end
  
  def create
   order = current_user.build_order
   redirect_to order_path(order)
  end
end
