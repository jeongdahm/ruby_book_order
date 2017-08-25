class User < ActiveRecord::Base
  
 has_many :order_items
 has_many :products, through: :order_items
 has_many :orders
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
 def cart_total_price
  products.map(&:price).sum
 end
 
 def build_order
   order = orders.create
   order.order_items << order_items
   order.update(total_price: cart_total_price)
   return order
 end
 
end
