# frozen_string_literal: true

require "rails_helper"

RSpec.describe CalculateFibonacci do
  subject(:context) { CalculateFibonacci }

  describe ".call" do
    context "when given a number" do
      it "succeeds" do
        expect(context.call(number: 10)).to be_a_success
      end

      it "calculates correct fibonacci numbers" do
        numbers = [
          [0, 0],
          [1, 1],
          [2, 1],
          [3, 2],
          [4, 3],
          [5, 5],
          [6, 8],
          [7, 13],
          [8, 21],
          [9, 34],
        ]
        numbers.each do |value, result|
          expect(context.call(number: value).result).to eq(result)
        end
      end
    end

    context "when no number given" do
      it "fails" do
        expect(context.call(number: nil)).to be_a_failure
      end
    end
  end
end
