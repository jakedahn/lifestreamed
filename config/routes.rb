Lifestreamed::Application.routes.draw do
  get "posts/index"

  get "posts/show"

  get "oauth/instagram", :as => 'instagram_oauth'
  devise_for :users
  root :to => "posts#index"

end
