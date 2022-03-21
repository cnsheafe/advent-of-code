defmodule Day1 do
  def count_increases(num_list), do: do_count_increases(num_list, 0)

  defp do_count_increases([_head | []], count), do: count

  defp do_count_increases([head | tail], count) do
    ct = if hd(tail) > head, do: count + 1, else: count

    do_count_increases(tail, ct)
  end

  def count_increases_with_window(num_list), do: do_count_increases_with_window(num_list, nil, 0)

  defp do_count_increases_with_window([head | tail], last_sum, count) when length(tail) >= 2 do
    window_sum =
      ([head] ++ Enum.take(tail, 2))
      |> Enum.sum()

    ct = if window_sum > last_sum and window_sum != nil, do: count + 1, else: count

    do_count_increases_with_window(tail, window_sum, ct)
  end

  defp do_count_increases_with_window(_list, _last_sum, count), do: count
end
