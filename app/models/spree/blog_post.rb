class Spree::BlogPost < ApplicationRecord
  belongs_to :blog, class_name: 'Spree::Blog'
  has_one :image, as: :viewable, class_name: 'Spree::BlogImage', dependent: :destroy, inverse_of: :viewable

  accepts_nested_attributes_for :image
end
