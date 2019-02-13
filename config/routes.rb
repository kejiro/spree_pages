Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :pages do
      collection do
        resources :blogs do
          resources :blog_posts
        end
      end
    end
    resources :blog_posts
  end

  resources :blog_posts, only: [:index, :show], path: "news"
end

Spree::Core::Engine.append_routes do
  resources :pages, only: [:show], path: "/"
end
