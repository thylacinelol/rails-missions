class CalculateFibonacci
  include Interactor

  def call
    context.fail! unless context.number.present?

    context.result = fibonacci(context.number)
  end

  private

  def fibonacci(n)
    i = 0
    j = 1
    while n > 0
      k = i + j
      i = j
      j = k
      n -= 1
    end

    i
  end
end
