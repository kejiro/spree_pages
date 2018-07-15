module Spree
  class Blog < ApplicationRecord
    has_many :posts, :class_name => 'Spree::BlogPost'
    default_scope -> { order(title: :asc) }

    scope :default, -> {
      where(title: 'default').first
    }

    def latest(limit = 10)
      posts.order(created_at: :desc).limit(limit)
    end

    class << self
      COMMENT_DISABLED = 0
      COMMENT_WITH_MODERATION = 1
      COMMENT_ALLOWED = 2

      def create_default
        self.create!(title: 'default', comment_status: Spree::Blog.COMMENT_WITH_MODERATION)
      end
    end
  end
end
