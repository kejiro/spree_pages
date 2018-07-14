module Spree
  module Admin
    class BlogPostsController < ResourceController
      def new
        @object.build_image
        super
      end

      def collection
        return @collection if @collection.present?
        # params[:q] can be blank upon pagination
        params[:q] = {} if params[:q].blank?

        @collection = super
        @search = @collection.ransack(params[:q])
        @collection = @search.result.
            page(params[:page]).
            per(50)
      end
    end
  end
end

