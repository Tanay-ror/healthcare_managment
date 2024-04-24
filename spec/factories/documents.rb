# spec/factories/documents.rb
FactoryBot.define do
  factory :document do
    document_type { %w[Aadhaar PAN Identity Passport Health_Check Policy Other].sample }
    association :user
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'example.pdf'), 'application/pdf') }
  end
end
