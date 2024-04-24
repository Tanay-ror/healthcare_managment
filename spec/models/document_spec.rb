# spec/models/document_spec.rb
require 'rails_helper'

RSpec.describe Document, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end
end
