# Maps
list_a = ["hello", "world", "scala", "has", "arrived"]
list_a |> Enum.group_by(&byte_size(&1))
# %{3 => ["has"], 5 => ["hello", "world", "scala"], 7 => ["arrived"]}


