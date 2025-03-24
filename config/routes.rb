Rails.application.routes.draw do
  root "events#index"

  resources :events do
    post "attend", to: "event_attendances#create"
    delete "unattend", to: "event_attendances#destroy"
  end
  resources :users
end
