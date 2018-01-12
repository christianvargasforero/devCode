Rails.application.routes.draw do

  resources :students

   namespace :api, :defaults => {:format => 'json'} do
      namespace :v1 do
        resources :students
      end
    end

  resources :notes
  resources :subjects
  resources :courses

  # Root
  root :to => "dashboard#index"  

end
