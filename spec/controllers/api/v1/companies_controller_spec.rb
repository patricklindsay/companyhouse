require 'rails_helper'

describe Api::V1::CompaniesController do
  describe '#show' do
    it 'should have specs..'
  end

  describe '#charges' do
    it 'should also have specs..'
  end

  describe '#index' do
    let(:api_key) { ApiKey.create! }
    let(:query_string) { 'foobar' }
    let(:query_params) { { api_key: api_key.access_token, q: query_string } }
    let(:companies) { '' }
    let(:client) { double(companies: companies) }

    before do
      allow(Client).to receive(:new).and_return(client)
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

      context 'when authentication to Company House fails' do
        let(:companies) { nil }

        it 'responds with error code 500' do
          parsed_response = JSON.parse(response.body)

          expect(parsed_response['errors'].first['error_code']).to eq 500
        end
      end
      context 'when no query string is supplied' do
        it 'responds with error code 400'
      end
    end
  end
end
