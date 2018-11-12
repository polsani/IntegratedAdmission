Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do

      post '/students', to: 'students#create'
      get '/students/:id', to: 'students#show'
      get '/students', to: 'students#index'

      post '/registrations', to: 'registrations#create'
      get '/registrations/:id', to: 'registrations#show'
      get '/registrations', to: 'registrations#index'

      get '/invoices/:id', to 'invoices#show'
    end
  end
end
