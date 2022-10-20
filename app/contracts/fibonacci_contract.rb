class FibonacciContract < Dry::Validation::Contract
  params do
    required(:n).value(:integer)
  end
end
