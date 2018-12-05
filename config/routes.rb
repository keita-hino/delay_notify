Rails.application.routes.draw do
  post '/callback' => 'gmail#callback'
end
