# spec/models/health_policy_spec.rb
require 'rails_helper'

RSpec.describe HealthPolicy, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end
end
