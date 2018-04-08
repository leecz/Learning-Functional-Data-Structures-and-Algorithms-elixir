defmodule SplitSubstring do
  def loop_v2(_i, str, _dict) when is_nil(str), do: nil
  def loop_v2(i, str, _dict) when byte_size(str) == i, do: nil
  def loop_v2(i, str, dict) do
    prefix = String.slice(str, 0..(i-1))
    suffix = String.slice(str, i..-1) 
    if(Enum.member?(dict, prefix)) do
      words = handle_v2(suffix, dict)
      if(words) do
        prefix <> " " <> words
      end
    else
      loop_v2(i+1, str, dict)
    end
  end

  def handle_v2(str, dict) do
    if Enum.member?(dict, str) do
      str
    else
      loop_v2(1, str, dict)
    end
  end

  def main() do
    # handle_v1("kidsoftheworldunite", ["kids", "the", "unite", "of", "world"]) |> IO.puts()
    handle_v2("kidsoftheworldunite", ["kids", "the", "unite", "of", "world"]) |> IO.puts()
    handle_v2("kidsoftheworlduniteall", ["kids", "the", "unite", "of", "world"]) |> IO.puts()
  end
end

SplitSubstring.main()

# 匹配字符串子集
# Input: A string s and a dictionary of words, represented by dict
# Output: Break the string into those words that are provided in the given dictionary.
# eg. s = "kidsoftheworldunite" dict = {"kids", "the", "unite", "of" "world"}
# output : "kids of the world unite"
# 这个程序还不完整，也没有加入 cache 优化。