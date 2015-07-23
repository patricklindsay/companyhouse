require 'rails_helper'

describe Api::V1::CompaniesController do
  describe '#index' do
    before do
      get :index, :format => :json
    end

    it 'responds successfully' do
      expect(response.success?).to be true
    end

    it 'status is ok' do
      expect(response.status).to eq 200
    end
  end
end
