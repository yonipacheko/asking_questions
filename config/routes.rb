PostitTemplate::Application.routes.draw do
  root to: 'questions#index'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resource :users, only: [:new, :create]

  resources :questions do
    resources :answers do
      member do
        post 'vote'  #questions/:question_id/answers/:id/vote(.:format)
      end
    end
  end
  get '/your_question', to: 'questions#your_questions'
end
