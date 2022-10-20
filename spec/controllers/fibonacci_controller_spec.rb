# frozen_string_literal: true

require "rails_helper"

RSpec.describe FibonacciController, type: :controller do
  describe "GET #index" do
    before do
      Timecop.freeze(Time.local(2022)) do
        (1..20).each { |i| create(:fibonacci, value: i, result: i) }
      end
    end

    it "responds with the 10 latest fibonacci calculations" do
      get :index
      expect(response).to be_ok
      expect(json_response).to eq(
        [
          {
            value: 20,
            result: 20,
            runtime: 0.1,
            created_at: "2021-12-31T23:00:00.000Z",
          },
          {
            value: 19,
            result: 19,
            runtime: 0.1,
            created_at: "2021-12-31T23:00:00.000Z",
          },
          {
            value: 18,
            result: 18,
            runtime: 0.1,
            created_at: "2021-12-31T23:00:00.000Z",
          },
          {
            value: 17,
            result: 17,
            runtime: 0.1,
            created_at: "2021-12-31T23:00:00.000Z",
          },
          {
            value: 16,
            result: 16,
            runtime: 0.1,
            created_at: "2021-12-31T23:00:00.000Z",
          },
          {
            value: 15,
            result: 15,
            runtime: 0.1,
            created_at: "2021-12-31T23:00:00.000Z",
          },
          {
            value: 14,
            result: 14,
            runtime: 0.1,
            created_at: "2021-12-31T23:00:00.000Z",
          },
          {
            value: 13,
            result: 13,
            runtime: 0.1,
            created_at: "2021-12-31T23:00:00.000Z",
          },
          {
            value: 12,
            result: 12,
            runtime: 0.1,
            created_at: "2021-12-31T23:00:00.000Z",
          },
          {
            value: 11,
            result: 11,
            runtime: 0.1,
            created_at: "2021-12-31T23:00:00.000Z",
          },
        ],
      )
    end
  end

  describe "POST #create" do
    context "when correct param" do
      it "returns calculation json" do
        post :create, params: { n: 20 }

        expect(response).to be_ok
        expect(json_response[:value]).to eq(20)
        expect(json_response[:result]).to eq(6765)
        expect(json_response[:runtime]).to be > 0
      end

      it "saves calculation to database" do
        expect { post :create, params: { n: 1 } }.to change {
          Fibonacci.count
        }.by(1)
      end

      it "stores very big numers in the database" do
        post :create, params: { n: 10_000 }
        record = Fibonacci.order(created_at: :desc).first
        expect(record.value).to eq(10_000)
        expect(record.result.to_s.size).to eq(2090)
      end
    end

    context "when incorrect param" do
      it "returns error message" do
        post :create, params: { nnn: 20 }

        expect(response).to be_bad_request
        expect(json_response[:errors].first[:text]).to eq("must be an integer")
      end
    end
  end
end
