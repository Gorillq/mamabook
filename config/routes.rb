Rails.application.routes.draw do
  get "dateandtime/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "site#index"
  get "about", to: "about#index"
  get "contact", to: "contact#index"
  get "rules", to: "rules#index"
  get "help", to: "help#index"
  get "dateandtime", to: "dateandtime#index"
  post "create_event", to: "dateandtime#reze"
  get "warn", to: "errors#warn", as: "warn"
end
