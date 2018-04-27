defmodule Greedy do
  def greedyChange(_, 0), do: []
  def greedyChange([head | tail], amount) when head > amount do
    greedyChange(tail, amount)
  end
  def greedyChange([head | _tail] = denom, amount) do
    [head | greedyChange(denom, amount - head)]
  end

  def btChanges(result, _denom, amount) when amount == 0, do: [result]
  def btChanges(_result, [], _amount), do: []
  def btChanges(_result, _denom, amount) when amount < 0, do: [] 
  def btChanges(result, [head | tail] = denom, amount) do
    btChanges([head | result], denom, amount - head) ++ btChanges(result, tail, amount)
  end


end

# Greedy.greedyChange([7, 2, 1], 21) |> IO.inspect
Greedy.btChanges([], [6, 2, 1], 7) |> IO.inspect



# 递归真是屌