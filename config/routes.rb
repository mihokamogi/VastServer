Rails.application.routes.draw do

root to: 'campaigns#index'


post "results?campaign=:id&cuepoint=:id&event=start", to: "results#create"
post "results?campaign=:id&cuepoint=:id&event=complete", to: "results#create"
get 'signup', to: 'users#new'
 
resources :cuepoints do
    resources :campaigns, only: [:index]
end

resources:cuepoints, except: :show
resources:campaigns, except: :show
resources :results, only: :index 



end

