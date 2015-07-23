class Api::V1::CompaniesController < ApplicationController
  before_filter :restrict_access

  def index
    render json: nil, status: :ok
  end

  private

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:api_key])
    head :unauthorized unless api_key
  end
end
