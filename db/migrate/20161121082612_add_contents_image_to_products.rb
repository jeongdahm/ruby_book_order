class AddContentsImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :contents_image, :string
  end
end
