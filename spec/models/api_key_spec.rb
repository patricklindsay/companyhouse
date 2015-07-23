require 'rails_helper'

describe ApiKey do
  describe 'before_create' do

    it 'creates a unique hex value as access_token' do
      allow(SecureRandom).to receive(:hex).and_return(:foo)
      api_key = ApiKey.create!

      expect(api_key.access_token).to eq 'foo'
    end

    it 'creates a unique hex after initial generated already exists'
  end
end
