defmodule BinaryTree do
  alias :math, as: Math
  def new(val) do
    %{value: val, left: :leaf, right: :leaf, count: 1}
  end

  def insert(:leaf, val) do
    new(val)
  end

  def insert(%{value: value} = tree, val) when val < value do
    Map.put(tree, :left, insert(tree.left, val))
  end
  def insert(%{value: value} = tree, val) when val > value do
    Map.put(tree, :right, insert(tree.right, val))
  end
  def insert(%{value: value} = tree, val) when val == value do
    Map.put(tree, :count, tree.count + 1)
  end

  def size(:leaf), do: 0
  def size(%{left: left, right: right}) do
    size(left) + size(right) + 1
  end
  
  def depth(:leaf), do: 0
  def depth(%{left: left, right: right}) do
    1 + (max(depth(left), depth(right)))
  end

  def complete_tree?(tree) do
    size(tree) == Math.pow(2, depth(tree)) - 1
  end

  def equal?(:leaf, :leaf), do: true
  def equal?(%{value: val1} = tree1, %{value: val2} = tree2) when val1 == val2 do
    equal?(tree1.left, tree2.left) && equal?(tree1.right, tree2.right)
  end
  def equal?(_t1, _t2), do: false

  def flip(:leaf), do: :leaf
  def flip(tree) do
    %{value: tree.value, count: tree.count, left: flip(tree.right), right: flip(tree.left)} 
  end

  def pre_order(:leaf), do: [] 
  def pre_order(%{left: left, value: value, right: right}) do
    [value] ++ pre_order(left) ++ pre_order(right)
  end

  def in_order(:leaf), do: []
  def in_order(%{left: left, value: value, right: right}) do
    in_order(left) ++ [value] ++ in_order(right)
  end

  def post_order(:leaf), do: []
  def post_order(%{left: left, value: value, right: right}) do
    post_order(left) ++ post_order(right) ++ [value] 
  end

  def pre_order_acc(:leaf, acc), do: acc
  def pre_order_acc(%{left: left, right: right, value: value}, acc) do
    IO.puts "at #{value}  -- "
    IO.inspect acc
    [value] ++ pre_order_acc(left, pre_order_acc(right, acc))
  end
end

t = BinaryTree.new(5) 
  |> BinaryTree.insert(3) 
  |> BinaryTree.insert(8) 
  |> BinaryTree.insert(1) 
  |> BinaryTree.insert(4) 
  |> BinaryTree.insert(7) 
  |> BinaryTree.insert(9) 

# t |> IO.inspect


y = BinaryTree.new(2) 
  |> BinaryTree.insert(1) 
  |> BinaryTree.insert(5) 
  |> BinaryTree.insert(9) 
# t |> BinaryTree.size() |> IO.puts
# t |> BinaryTree.depth() |> IO.puts
# t |> BinaryTree.complete_tree? |> IO.puts

# k = Map.new(t)
# Map.equal?(t, k) |> IO.puts
# BinaryTree.equal?(t, k) |> IO.puts
# BinaryTree.equal?(y, k) |> IO.puts
# t |> BinaryTree.flip() |> IO.inspect

y |> IO.inspect 

IO.puts "pre_order"
y |> BinaryTree.pre_order() |> IO.inspect

IO.puts "in order"
y |> BinaryTree.in_order() |> IO.inspect

IO.puts "post order"
y |> BinaryTree.post_order() |> IO.inspect

IO.puts "pre order acc"
y |> BinaryTree.pre_order_acc([]) |> IO.inspect
