PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, except: [:destory]
  resources :categories, only: [:new, :create, :show]
end
