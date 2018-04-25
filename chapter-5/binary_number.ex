defmodule BinaryNumber do
  def carry(0, tail), do: tail
  def carry(1, []), do: [1]
  def carry(1, [head | tail]) do
    [1 - head | carry(head, tail)]
  end
  def carry(_, _), do: raise "invalid input"

  def add(ps, qs) do 
    _add(0, Enum.reverse(ps), Enum.reverse(qs)) |> Enum.reverse
  end
  def _add(c , [], []), do: carry(c, [])
  def _add(c, [], qs), do: carry(c, qs)
  def _add(c, ps, []), do: carry(c, ps)
  def _add(c, [x | x_tail], [y | y_tail]) do
    head = c + x + y
    [rem(head, 2) | _add(div(head, 2), x_tail, y_tail)]
  end

  def mult(first, second) when is_list(first) and is_list(second) do
    _mult(Enum.reverse(first), Enum.reverse(second)) |> Enum.reverse
  end
  def _mult([], _), do: []
  def _mult([ 0 | tail], qs) do
    [ 0 | _mult(tail, qs)]
  end
  def _mult([ 1 | tail], qs) do
    _add(0, qs, [ 0 | _mult(tail, qs)])
  end
end

l = [1, 1, 0, 1]
# 0 |> BinaryNumber.carry(l) |> IO.inspect
# 1 |> BinaryNumber.carry(l) |> IO.inspect

k = [1, 0, 1, 0]

# l |> BinaryNumber.add(k) |> IO.inspect

l |> BinaryNumber.mult(k) |> IO.inspect


# 二进制 list 的 进位，加法 和 乘法 操作。