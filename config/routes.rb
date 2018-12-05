Rails.application.routes.draw do
  post '/callback' => 'gmail#callback'
  get '/notify' => 'gmail#notify'
end
