class CartController < ApplicationController
    def destroy
      
      product = current_user.order_items.where(product: params[:id]).last
      product.destroy
      
      product.destroy
      respond_to do |format|
        format.html { redirect_to cart_index_url, notice: 'Item in shopping cart was deleted.' }
        format.json { head :no_content }
      end
    end
    
    def index
     if user_signed_in?
         @products = current_user.products
     else
         redirect_to root_path
     end
    end
    
    def create
      if user_signed_in?
        product = Product.find params[:product_id]
        current_user.products << product
        redirect_to cart_index_path
      else
        redirect_to root_path 
      end
    end
end
