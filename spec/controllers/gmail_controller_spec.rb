require 'rails_helper'

RSpec.describe GmailController, type: :controller do
  before do
    FactoryBot.create(:weather)
    FactoryBot.create(:threshold)
  end
  describe 'POST #callback' do
    it 'saves the new weather and threshold in the database' do
      post :callback,params: { test: "test" }
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET #notify' do
    it 'notify via line and slack' do
      get :notify
      expect(response).to have_http_status(:success)
    end
  end
end
