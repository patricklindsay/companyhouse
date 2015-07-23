# Token to be provided on each request
class ApiKey < ActiveRecord::Base
  before_create :generate_access_token

  private

  # Generates a unique hex
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
