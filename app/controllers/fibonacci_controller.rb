class FibonacciController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    fibonacci_contract = FibonacciContract.new.call(n: params[:n])
    if fibonacci_contract.failure?
      return(
        render(
          json: {
            errors: fibonacci_contract.errors,
          },
          status: :bad_request,
        )
      )
    end

    calculation =
      CreateFibonacciCalculation.call(number: fibonacci_contract[:n])

    if calculation.success?
      record = calculation.record
      json =
        # Tech debt: would love to use AMS or a similar serialization library, however,
        # currently all of the serialization libraries are outdated and not maintained (except Jbuilder)
        Jbuilder.new do |json|
          json.value(record.value)
          json.result(record.result.to_i)
          json.runtime(record.runtime)
        end

      render(json: json.target!)
    else
      render(json: { errors: calculation.error }, status: :unprocessable_entity)
    end
  end
end
