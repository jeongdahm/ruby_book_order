ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :price, :provider_id, :description, :contents_image
 
 
 #photo setting 
 
 form do |f|
   image_preview = -> {
     if f.object.contents_image.present?
       image_tag(f.object.contents_image.url)
     else
       content_tag(:span, "no thumbnail image yet")
     end
   }

   f.input :contents_image, as: :uploader, hint: image_preview.call, removable: false
   f.input :name
   f.input :price
   f.input :description
   f.actions
 end


show do |item|
    attributes_table_for product do
      row :contents_image do
        img( src: item.contents_image, height: 200 )
      end
      row (:name)
      row :price
      row :description
    end
  end
  
  #show some column 
  #index do |i|
  # column :id
  # column :name
  #end
  
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
