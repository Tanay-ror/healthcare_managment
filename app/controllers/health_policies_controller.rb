class HealthPoliciesController < ApplicationController
  def create
    @health_policy = HealthPlicy.new(health_policy_param)
    if @health_policy.save
      render json: @health_policy, status: :created
    else
      render json: @health_policy.errors, status: :unprocessable_entity
    end
  end

  private

  def health_policy_param
    params.require(:health_policy).permit(:name, :expiry_date, :user_id)
  end
end
