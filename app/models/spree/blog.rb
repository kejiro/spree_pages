module Spree
  class Blog < ApplicationRecord
    default_scope -> { order(title: :asc) }

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
