Rails.application.routes.draw do
  root 'counter#menu'
  get 'counter/menu'
  get 'counter/incr'
  get 'counter/decr'
  get 'counter/reset'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
