Rails.application.routes.draw do

	devise_for :users, controllers: {
        sessions: 'users/sessions',
        passwords: 'users/passwords',
        registrations: 'users/registrations'
    }


	constraints(host: /^(?!www\.)/i) do
	    match '(*any)' => redirect { |params, request|
	      URI.parse(request.url).tap { |uri| uri.host = "www.#{uri.host}" }.to_s
	    }, :via => :all
 	end

	root to: 'pages#home'

	match "/404", :to => "errors#not_found", :via => :all
	match "/422", :to => "errors#unacceptable", :via => :all
	match "/500", :to => "errors#internal_server_error", :via => :all

	get '/sitemap.xml' => 'sitemaps#index', :format => 'xml', :as => :sitemap

	get 'robots.:format' => 'pages#robots'

	match '/contacts',     to: 'contacts#new',             via: 'get'
	resources "contacts", only: [:new, :create]

	resources :blogs do
		member do
            put "like" => "blogs#upvote"
            put "unlike" => "blogs#unvote"
        end
        resources :comments, :only => [:index, :new, :edit, :create, :update, :destroy] 
	end

	get 'creation-site-internet' => 'services#creation_site_internet'
	get 'referencement' => 'services#referencement'

	dynamic_error_pages
  
end
