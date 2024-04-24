# config/initializers/jwt.rb
JWT_SECRET = Rails.application.credentials.jwt_secret_key || ENV['JWT_SECRET_KEY']
