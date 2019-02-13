module Spree
  class BlogPost < Base
    extend FriendlyId
    friendly_id :title, use: :slugged

    belongs_to :blog, class_name: 'Spree::Blog'
    belongs_to :creator, class_name: 'Spree::User', foreign_key: :created_by
    has_one :image, as: :viewable, class_name: 'Spree::BlogImage', dependent: :destroy, inverse_of: :viewable

    accepts_nested_attributes_for :image

    self.whitelisted_ransackable_attributes = %w[description title]

    scope :visible, -> {
      where("available_on < ?", Time.now).order(available_on: :desc)
    }

  end
end

