class Api::V1::CompaniesController < ApplicationController
  before_filter :restrict_access

  def index
    results = client.companies

    if results.nil?
      render :json => { :errors => [connection_error] }
    else
      render json: results, status: :ok
    end
  end

  private

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:api_key])
    head :unauthorized unless api_key
  end

  def client
    @client ||= Client.new
  end

  def connection_error
    {
      error_code: 500,
      message: 'Error connecting to company house'
    }
  end
end
