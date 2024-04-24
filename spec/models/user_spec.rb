# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end

  describe 'associations' do
    it { should have_many(:health_policies) }
    it { should have_many(:documents) }
  end
end
