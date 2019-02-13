module Spree
  module Admin
    class PagesController < ResourceController
      def index
        session[:return_to] = request.url
        respond_with(@collection)
      end

      protected

      def find_resource
        Page.friendly.find(params[:id])
      end

      def collection
        return @collection if @collection.present?
        @collection = super
        @search = @collection.ransack(params[:q])
        @collection = @search.result.page(params[:page]).per(Spree::Config[:admin_users_per_page])
      end

      def location_after_save
        spree.edit_admin_page_url(@page)
      end
    end
  end
end

