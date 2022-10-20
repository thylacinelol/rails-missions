# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FibonacciController, type: :controller do
  describe 'POST #create' do
    context 'when correct param' do
      it 'returns calculation json' do
        post :create, params: { n: 20 }

        expect(response).to be_ok
        expect(json_response[:value]).to eq(20)
        expect(json_response[:result]).to eq(6765)
        expect(json_response[:runtime]).to be > 0
      end
    end

    context 'when incorrect param' do
      it 'returns error message' do
        post :create, params: { nnn: 20 }

        expect(response).to be_bad_request
        expect(json_response[:errors].first[:text]).to eq('must be an integer')
      end
    end
  end
end

