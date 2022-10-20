class FibonacciController < ApplicationController
  include FibonacciHelper

  skip_before_action :verify_authenticity_token

  def create
    fibonacci_contract = FibonacciContract.new.call(n: params[:n])

    if fibonacci_contract.success?
      result = benchmark_ms { CalculateFibonacci.call(number: fibonacci_contract[:n]) }
      calculation = result[:result]

      if calculation.success?
        render(json: { value: fibonacci_contract[:n], result: calculation.result, runtime: result[:time] })
      else
        render(json: { errors: calculation.errors }, status: :unprocessable_entity)
      end
    else
      render(json: { errors: fibonacci_contract.errors }, status: :bad_request)
    end
  end
end
