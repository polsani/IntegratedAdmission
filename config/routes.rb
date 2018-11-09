Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post '/students/create'
      get '/students/:id', to: 'students#show'
    end
  end
end
