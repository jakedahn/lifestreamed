Lifestreamed::Application.routes.draw do
  get "oauth/instagram", :as => 'instagram_oauth'
  devise_for :users
  root :to => "setup#install"

end
