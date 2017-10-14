Rails.application.routes.draw do
  resources :barcodes
  post "barcodes/createBarcodes", to: 'barcodes#createBarcodes',:as => :createBarcodes
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
