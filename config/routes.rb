Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/scanner'
  post "pages/addScan", to: 'pages#addScan',:as => :addScan

  resources :barcodes
  post "barcodes/createBarcodes", to: 'barcodes#createBarcodes',:as => :createBarcodes
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
