module Spree
  class BlogPostsController < Spree::StoreController
    before_action :load_post, only: :show
    before_action :load_posts, only: :index

    def show

    end


    def load_post
      @post = Spree::BlogPost.visible.friendly.find(params[:id])
    end

    def load_posts
      @posts = Spree::BlogPost.visible.order(created_at: :desc).page(params[:page]).per(20)
    end
  end
end
