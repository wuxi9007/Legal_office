Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cases do
    collection do
      post :filter_personnel
    end
  end
  resources :personnels
  resources :companies
  resources :documents
  resources :homes
  resources :simulations do 
  	collection do
  		post :assign_test
      get :choose_audit_section
  	end
  end
  root "homes#index"
end
