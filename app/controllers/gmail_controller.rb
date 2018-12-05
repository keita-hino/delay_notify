class GmailController < ApplicationController
  protect_from_forgery :except => [:callback]
  def callback
    puts "test"
    # client = Signet::OAuth2::Client.new({
    #       client_id: ENV.fetch('GOOGLE_API_CLIENT_ID'),
    #       client_secret: ENV.fetch('GOOGLE_API_CLIENT_SECRET')
    #     })
    # client.token_credential_uri = 'https://www.googleapis.com/oauth2/v3/token'
    # client.redirect_uri = url_for(action: :callback)
    # client.code = params[:code]
    # response = client.fetch_access_token!
    # session[:access_token] = response['access_token']
    # redirect_to url_for(action: :getmail)
  end

end
