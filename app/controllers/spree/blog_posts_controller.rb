module Spree
  class BlogPostsController < Spree::StoreController
    before_action :load_post, only: :show
    before_action :load_posts, only: :index
    helper 'spree/pages'

    def show

    end


    def load_post
      @post = Spree::BlogPost.visible.friendly.find(params[:id])
    end

    def load_posts
      @posts = Spree::BlogPost.visible.order(available_on: :desc).page(params[:page]).per(20)
    end
  end
end
