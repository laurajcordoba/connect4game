Rails.application.routes.draw do
  get 'push' => 'players#push'

  resources :players

  root 'welcome#index'
end
