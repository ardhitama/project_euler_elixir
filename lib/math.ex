defmodule Math do

  def fib(a, _, 0 ) do
    a
  end
  def fib(a, b, n) do
    fib(b, a+b, n-1)
  end

  def is_prime(n, i) when i < n do
    if rem(n, i) == 0 do
      #is_prime(n, i+1)
      false
    else
      is_prime(n, i+1)
    end
  end
  def is_prime(n, i) when i >= n do
    true
  end
  def is_prime(n) do
    cond do
    n <= 1 -> false
    n <= 3 -> true
    rem(n, 2) == 0 or rem(n, 3) == 0 -> false
    true -> is_prime(n, 3)
    end
  end

  def prime_factors_slow_print(n) do
    3..n-1
    |> Stream.filter(fn i -> rem(n, i) == 0 end)
    |> Stream.filter(fn i -> is_prime(i) end)
    |> Enum.each(fn n -> IO.puts n end)
  end

  def max_prime_factors(n) do
    max_prime_factors(n, 3)
  end
  def max_prime_factors(n, i) when i <= n do
    if rem(n, i) == 0 do
      max_prime_factors(div(n, i), i + 2)
    else
      max_prime_factors(n, i+2)
    end
  end
  def max_prime_factors(n, i) when i > n do
    i - 2
  end
end
