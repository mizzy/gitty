Gitty::Application.routes.draw do

  root to: 'home#index', as: 'home'

  controller :sessions do
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end

  post 'compare'        => 'home#compare', as: 'compare'
  get  'diff/:versions' => 'home#diff',    as: 'diff'

  resources :users

end
