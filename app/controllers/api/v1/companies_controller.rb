class Api::V1::CompaniesController < ApplicationController
  before_filter :restrict_access
  before_filter :require_query, only: [:index]

  # GET /
  def index
    results = client.companies(params[:q], params)

    if results.nil?
      render_error_and_return(connection_error)
    else
      render json: results, status: :ok
    end
  end

  # GET /:id
  def show
    company_number = params[:id]

    results = client.company(company_number)

    if results.nil?
      render_error_and_return(connection_error)
    else
      render json: results, status: :ok
    end
  end

  private

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:api_key])
    head :unauthorized unless api_key
  end

  def require_query
    render_error_and_return(query_error) if params[:q].nil?
  end

  def client
    @client ||= Client.new
  end

  # @return [Hash] error informing consumer a query string is required
  def query_error
    {
      error_code: 400,
      message: 'A query string must be provided.'
    }
  end

  # @return [Hash] error informing consumer there is a connection problem with Company House
  def connection_error
    {
      error_code: 500,
      message: 'Error connecting to company house'
    }
  end

  # Renders a supplied error has as json
  def render_error_and_return(error)
    render :json => { :errors => [error] } and return
  end
end
