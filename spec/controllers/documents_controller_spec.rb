# spec/controllers/documents_controller_spec.rb
require 'rails_helper'
require 'jwt'
RSpec.describe DocumentsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }    


    context 'with valid params' do

      it 'creates a new document' do
        token = JWT.encode(user.id, nil, 'none')
        expect {
          post :create, params: { document: attributes_for(:document), token: token }
        }.to change(Document, :count).by(1)
      end

      it 'returns a 200 status code' do
        token = JWT.encode(user.id, nil, 'none')
        post :create, params: { document: attributes_for(:document), token: token }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'returns unprocessable_entity status code' do
        post :create, params: { document: { document_type: 'Invalid' }}
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
