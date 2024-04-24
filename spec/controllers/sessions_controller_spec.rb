# spec/controllers/sessions_controller_spec.rb
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    let!(:user) { create(:user) }

    context 'with valid credentials' do
      it 'returns a token' do
        post :create, params: { email: user.email, password: user.password }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context 'with invalid credentials' do
      it 'returns unauthorized status' do
        post :create, params: { email: user.email, password: 'invalid_password' }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to eq('Invalid email or password')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'returns a success message' do
      delete :destroy
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['message']).to eq('Logged out successfully')
    end
  end
end
