Rails.application.routes.draw do
  
  root "welcome#index"
  resources :retinas
  resources :retina_steps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "retinas" => "retinas#index"
end
