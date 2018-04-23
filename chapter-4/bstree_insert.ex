defmodule BST do
  def new(key, data) do
    %{key: key, data: data, left: nil, right: nil, count: 1}
  end

  def insert(key, data) do
    new(key, data)
  end

  def insert(nil, key, data) do
    new(key, data)
  end

  def insert(tree, key, data) do
    cond do
      key > tree.key ->
        Map.put(tree, :right, insert(tree.right, key, data))
      key < tree.key ->
        Map.put(tree, :left, insert(tree.left, key, data))
      true ->
        Map.put(tree, :count, tree.count + 1)
    end
  end
end

t = BST.insert(3, "a") 
t
  |> BST.insert(4, "b") 
  |> BST.insert(1, "haha") 
  |> BST.insert(6, "haha") 
  |> BST.insert(2, "haha") 
  |> BST.insert(2, "haha") 
  |> IO.inspect