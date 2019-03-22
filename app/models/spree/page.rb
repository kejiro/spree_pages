module Spree
  class Page < Spree::Base
    extend FriendlyId
    friendly_id :slug_candidates, use: [:slugged], slug_column: :permalink
    before_validation :normalize_slug, on: :update

    validates :permalink, presence: true, uniqueness: {allow_blank: true}

    scope :active, -> {where("available_on <= ?", Time.now)}

    def deleted?
      false
    end


    private

    def normalize_slug
      self.permalink = normalize_friendly_id(permalink)
    end


    def slug_candidates
      [
          :title,
          [:title, :created_at]
      ]
    end

  end
end