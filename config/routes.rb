Rails.application.routes.draw do
  resources :number_arrays
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  post 'create/number_arrays', to: 'number_arrays#createArray'
  get 'get/number_arrays/:id', to: 'number_arrays#listRange'
end
