module FibonacciHelper
  def benchmark_ms
    start_time = Time.now
    result = yield
    end_time = Time.now
    time_spent_ms = (end_time - start_time) * 1000

    {
      result: result,
      time: time_spent_ms
    }
  end
end
