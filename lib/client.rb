# Client class used to send requests to the Company House API
class Client
  include HTTParty

  base_uri 'https://api.companieshouse.gov.uk/'

  attr_accessor :options

  def initialize
    @options = { basic_auth: { username: Settings.private_key } }
  end

  # Find extended company information
  #
  # @param company_number [String] company house reference number
  # @return [Response] response from company house API
  def company(company_number)
    get("/company/#{company_number}")
  end

  # Search for companies using Company House API
  #
  # @param query [String] query string to search companies by name
  # @param client_params [Hash] additional search options to pass through to company house API
  # @return [Response] response from company house API
  def companies(query, client_params)
    self.options[:query] = { q: query }
    self.options[:query][:items_per_page] = client_params[:items_per_page] if client_params[:items_per_page]
    self.options[:query][:start_index] = client_params[:start_index] if client_params[:start_index]

    get('/search/companies')
  end

  private

  def get(path)
    self.class.get(path, self.options)
  end
end
