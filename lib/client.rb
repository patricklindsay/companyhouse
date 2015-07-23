# Client class used to send requests to the Company House API
class Client
  include HTTParty

  base_uri 'https://api.companieshouse.gov.uk/'

  attr_accessor :options

  def initialize
    @options = { basic_auth: { username: Settings.private_key } }
  end

  def companies(query, client_params)
    self.options[:query] = { q: query }
    self.options[:query][:items_per_page] = client_params[:items_per_page] if client_params[:items_per_page]
    self.options[:query][:start_index] = client_params[:start_index] if client_params[:start_index]

    self.class.get('/search/companies', self.options)
  end
end
