Rails.application.routes.draw do

  Rails.application.config.session_store :cookie_store, key: '_your_app_session'

  get 'new', to: 'games#new'

  post 'score', to: 'games#score'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
