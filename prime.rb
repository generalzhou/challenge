class Prime

  def initialize
    @primes = [2]
  end

  def get_primes(n)
    raise ArgumentError, 'n must be a positive integer' if (n < 1 || !n.is_a?(Integer))
    i = @primes.last + 1
    while @primes.size < n do
      @primes << i if is_prime(i)
      i += 1
    end
    @primes[0...n]
  end

  private

  def is_prime(num)
    @primes.each do |prime|
      return false if num % prime == 0
    end
    true
  end
end