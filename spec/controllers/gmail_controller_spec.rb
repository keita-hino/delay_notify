require 'rails_helper'

RSpec.describe GmailController, type: :controller do
  describe 'POST #callback' do
    it 'callback' do
      post :callback,params: { test: "test" }
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET #notify' do
    it 'notify' do
      get :notify
      expect(response).to have_http_status(:success)
    end
  end
end
