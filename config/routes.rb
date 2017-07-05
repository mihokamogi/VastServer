Rails.application.routes.draw do

root to: 'campaigns#index'

get "results/record"


resources :cuepoints do
    resources :campaigns, only: [:index]
end

resources:campaigns, except: :show
resources :results, only: [:index]



end

