class UsersController < ApplicationController
  
  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user,status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def details
    user = current_user
    if user
      render json: user_details(user), status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  private

  def user_details(user)
    {
      name: user.name,
      dob: user.dob,
      mobile_number: user.mobile_number,
      document_ids: user.documents.pluck(:id),
      health_policies: user.health_policies.map do |policy|
        {
          id: policy.id,
          name: policy.name,
          expiry: policy.expiry,
          document_ids: policy.documents.pluck(:id)
        }
      end
    }
  end

  def user_params
    params.require(:user).permit(:name, :email, :dob, :mobile_number, :password, :password_confirmation)
  end
end
