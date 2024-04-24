# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new user' do
        expect {
          post :create, params: { user: attributes_for(:user) }
        }.to change(User, :count).by(1)
      end

      it 'returns a 201 status code' do
        post :create, params: { user: attributes_for(:user) }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'returns unprocessable_entity status code' do
        post :create, params: { user: { email: 'noemail@yopmail.com' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
