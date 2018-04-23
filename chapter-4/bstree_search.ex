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


  def search_range(nil, _min, _max), do: [] 
  def search_range(tree, min, max) do
    search_range(tree, min, max, [])
  end
  def search_range(nil, _min, _max, map_result), do: map_result
  def search_range(%{key: key, left: left, data: data, right: right}, min, max, map_result) do
    temp_list = []
    if( key > min) do
      temp_list = search_range(left, min, max, map_result)
    end
    if min < key && key < max do
      temp_list = [data]
    end
    if max > key do
      temp_list =  search_range(right, min, max, map_result)
    end
    temp_list ++ map_result
  end

  def search(nil, _key), do: nil
  def search(%{key: key, left: left}, query_key) when key > query_key do
    search(left, query_key)
  end
  def search(%{key: key}=tree, query_key) when key == query_key do
    tree
  end
  def search(%{key: key, right: right}, query_key) when key < query_key do
    search(right, query_key)
  end

end

t = 
  BST.insert(3, "a") 
  |> BST.insert(4, "b") 
  |> BST.insert(1, "haha") 
  |> BST.insert(6, "haha") 
  |> BST.insert(2, "haha") 
  |> BST.insert(5, "haha") 

# t |> IO.inspect
BST.search_range(t, 3, 4) |> IO.inspect
# BST.search(t, 5) |> IO.inspect
# BST.search(t, 2) |> IO.inspect