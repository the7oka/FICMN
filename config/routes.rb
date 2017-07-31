Rails.application.routes.draw do
  namespace :cp do
    get 'cats/edit'
  end

	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations"}
	devise_scope :user do
		get "/users/sign_out" => "devise/sessions#destroy"
	end
	namespace :cp do
	  resources :posts,:subcats,:cats, :pages, :contactmes
	end
	resources :queries, except: [:index,:new]
	get 'queries/new/:subcat' => 'queries#new'

	resources :payment_forms
	get 'submit_payment/:id/:id2' => 'payment_forms#submit_payment'

	get 'cp' => 'cp/posts#index'
	get 'cp/users' => 'cp/users#index'
	get 'cp/statistics' => 'cp/users#statistics'
	get 'getsubcat/:id' => 'queries#getsubcat'
	get 'myqueries' => 'queries#myqueries'
	get 'myhistory' => 'queries#myhistory'
	get 'myinvoices' => 'queries#myinvoices'
	get 'pending_invoices' => 'queries#pending_invoices'

	get 'payment' => 'orders#payment'
	post 'payment' => 'orders#create_payment',as: 'new_payment'
	get 'success/:id' => 'orders#success'

	get '/services/:id' => 'home#cats'
	get '/sub_services/:id' => 'home#subcats'


	get 'cp/contacts' => 'cp/contacts#index'
	get 'cp/contacts/:id/edit' => 'cp/contacts#edit', as: 'cp_contacts_edit'
	patch 'cp/contacts/:id/edit' => 'cp/contacts#update'
	get 'cp/contacts/:id/delete' => 'cp/contacts#delete'

	get 'cp/contactmes/:id/delete' => 'cp/contactmes#delete'

	get 'cp/payment_forms/:id/edit' => 'cp/payment_forms#edit', as: 'cp_payment_forms_edit'
	patch 'cp/payment_forms/:id/edit' => 'cp/payment_forms#update'
	get 'cp/payment_forms/:id/delete' => 'cp/payment_forms#delete'

	get 'cp/invoices/new/:id' => 'cp/invoices#new',as: 'invoices'
	post 'cp/invoices/new/:id' => 'cp/invoices#create'
	get 'cp/queries/show/:id' => 'cp/invoices#show'
	get 'cp/payments/show/:id' => 'cp/invoices#show_payment'

	get 'invoices/:id/payment' => 'orders#new',as: 'orders'
	post 'invoices/:id/payment' => 'orders#create'	
	get 'cp/payments' => 'cp/invoices#index'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get 'our_services' => 'home#our_services'
	get 'careers' => 'home#careers'
	get 'news' => 'home#news'
	get 'financial_news' => 'home#onews'
	get 'services' => 'home#services'
	get 'about' => 'home#about'

	get 'millionaire_club' => 'home#millionaire_club'
	get 'business_start_ups' => 'home#business_start_ups'
	get 'media_advertising' => 'home#media_advertising'
	get 'business_evaluation' => 'home#business_evaluation'
	get 'women_and_money' => 'home#women_and_money'
	get 'fic_community_outreach' => 'home#fic_community_outreach'
	get 'locations' => 'home#locations'
	get 'contact_us' => 'home#contact_us'
	post 'contact_us' => 'home#create', as: "contactmes"
	
	root 'home#index'
end















