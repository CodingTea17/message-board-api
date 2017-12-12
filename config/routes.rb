Rails.application.routes.draw do

  resources :groups do
    resources :messages
  end
end
