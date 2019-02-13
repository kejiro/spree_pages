module Spree
  class PagesController < Spree::StoreController
    before_action :load_page, only: :show


    private

    def load_page
      @page = Page.friendly.distinct(false).find(params[:id])
    end

  end
end