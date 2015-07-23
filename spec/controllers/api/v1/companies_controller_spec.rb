require 'rails_helper'

describe Api::V1::CompaniesController do
  describe '#index' do
    let!(:api_key) { ApiKey.create! }
    let(:query_params) { { api_key: api_key.access_token } }

    before do
      get :index, query_params
    end

    context 'when providing an invalid token' do
      let(:query_params) { { api_key: 'foobar' } }

      it 'responds with status code 401' do
        expect(response.status).to eq 401
      end
    end

    context 'when providing a valid token' do
      it 'status is ok' do
        expect(response.status).to eq 200
      end
    end
  end
end
