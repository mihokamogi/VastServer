Rails.application.routes.draw do

root to: 'campaigns#index'

get "cuepoints/:id/campaigns" , to: "campaigns#index" 
post "results?campaign=:id&cuepoint=:id&event=start", to: "results#create"
post "results?campaign=:id&cuepoint=:id&event=complete", to: "results#create"
get "/cuepoints/:id", to: "cuepoints#edit"

resources:cuepoints, except: :show
resources:campaigns, except: :show
resources :results, only: :index 



end

