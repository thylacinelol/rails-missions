# frozen_string_literal: true

FactoryBot.define do
  factory :fibonacci do
    value { 9 }
    result { 34 }
    runtime { 0.1 }
  end
end
