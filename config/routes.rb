Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, except: [:index] do
  collection do
    post :login
  end
end
resources :questions do
  resources :answers
end

end
