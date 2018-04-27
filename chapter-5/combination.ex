defmodule Combination do
  def permutate(collection, filter \\ fn _p -> true end) do
    collection
    |> Enum.to_list()
    |> do_permutate(filter, [], [])
  end

  defp do_permutate([], filter, pick_acc, acc) do
    if filter.(pick_acc), do: [pick_acc | acc], else: acc
  end

  defp do_permutate(list, filter, pick_acc, acc) do
    list
    |> Stream.unfold(fn [h | t] -> {{h, t}, t ++ [h]} end)
    |> Enum.take(Enum.count(list))
    |> Enum.reduce(acc, fn {h, t}, acc ->
      do_permutate(t, filter, [h | pick_acc], acc)
    end)
  end

end

Combination.permutate([1, 2, 3]) |> IO.inspect
