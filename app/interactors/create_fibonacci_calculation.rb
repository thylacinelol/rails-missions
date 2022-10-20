class CreateFibonacciCalculation
  include FibonacciHelper
  include Interactor

  def call
    context.fail! unless context.number.present?

    result = benchmark_ms { CalculateFibonacci.call(number: context.number) }
    calculation = result[:result]
    runtime = result[:time]

    record =
      Fibonacci.new(
        value: context.number,
        result: calculation.result,
        runtime: runtime,
      )

    if record.save
      context.record = record
    else
      context.error = record.errors.full_messages
      context.fail!
    end
  end
end
