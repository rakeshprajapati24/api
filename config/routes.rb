Api::Application.routes.draw do
  root "home#index"

  namespace :api do
  namespace :v1 do
    resources :blogs
  end
end
end
