defmodule BinarySearchTree do
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  def insert(nil, node_value), do: new(node_value)

  def insert(%{data: data, left: left, right: right}, node_value) do
    if node_value <= data do
      %{data: data, left: insert(left, node_value), right: right}
    else
      %{data: data, left: left, right: insert(right, node_value)}
    end
  end

  # 前序遍历
  def pre_order(tree) do
    pre_order(tree, []) |> Enum.reverse()
  end

  def pre_order(nil, accum) do
    accum
  end

  def pre_order(tree, accum) do
    
    temp = [tree.data | accum]
    left_temp = pre_order(tree.left, temp)
    pre_order(tree.right, left_temp)

  end

  def in_order(tree) do
    in_order(tree, []) |> Enum.reverse()
  end

  def in_order(nil, accum) do
    accum
  end

  def in_order(tree, accum) do
    left_side = in_order(tree.left, accum)
    middle = [tree.data | left_side]
    in_order(tree.right, middle)
  end
  
  def get_depth(nil), do: 0

  def get_depth(tree) do
    left_depth = get_depth(tree.left) + 1
    right_depth = get_depth(tree.right) + 1
    max(left_depth, right_depth)
  end

  def count(nil), do: 0

  def count(tree) do
    count(tree.left) + count(tree.right) + 1
  end

  # 到 k 层有多少个节点
  def get_k_level(_tree, 0), do: 0
  def get_k_level(_tree, 1), do: 1
  def get_k_level(nil, _k), do: 0

  def get_k_level(tree, k) do
    get_k_level(tree.left, k - 1) + get_k_level(tree.right, k - 1)
  end

  # 叶子节点个数
  def count_leaf(nil), do: 0
  def count_leaf(tree) do
    if(!tree.left && !tree.right) do
      1
    else
      count_leaf(tree.left) + count_leaf(tree.right)
    end
  end

  # 镜像，翻转
  def mirror(nil), do: 
  def mirror( tree ) do
    temp = tree.left
    tree.left = tree.right
    tree.right = temp

    mirror(tree.left)
    mirror(tree.right)
  end
end

bt = BinarySearchTree.new(5)

bt2 = bt |> BinarySearchTree.insert(3) 
   |> BinarySearchTree.insert(4) 
   |> BinarySearchTree.insert(7) 

bt2 |> BinarySearchTree.in_order() |> IO.inspect
bt2 |> BinarySearchTree.get_depth |> IO.puts
bt2 |> BinarySearchTree.get_k_level(2) |> IO.puts
bt2 |> BinarySearchTree.pre_order() |> IO.inspect
bt2 |> BinarySearchTree.count() |> IO.inspect
bt2 |> BinarySearchTree.count_leaf() |> IO.inspect

# https://github.com/exercism/elixir/tree/master/exercises/binary-search-tree
