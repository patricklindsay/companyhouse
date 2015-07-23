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

    self.class.get('/search/companies', self.options)
  end
end
