class Product < ActiveRecord::Base
  belongs_to :provider
  mount_uploader :contents_image, ContentsImageUploader
end
