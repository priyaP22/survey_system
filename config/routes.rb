Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :surveys

  resources :survey_responses

  namespace :api do
      resources :surveys do
        post "add_question"
        post "destroy_question"
        post "destroy_survey_questions"
      end
  end

  root "surveys#index"

  resources 'users', only: [:create]

  post 'user/:id/change_name' => 'users#create', as: :signup_as_new
end
