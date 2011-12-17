Gitty::Application.routes.draw do

  root to: 'home#index', as: 'home'

  controller :sessions do
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end

  get 'diff/:id' => 'home#diff', as: 'diff'

  resources :users

end
