defmodule Day2 do
  def calc_position(directions), do: do_calc_position(directions, 0, 0)

  defp do_calc_position([], horizontal, depth), do: horizontal * depth

  defp do_calc_position([head | tail], horizontal, depth) do
    {h, d} =
      case head do
        {:forward, h} ->
          {horizontal + h, depth}

        {:down, d} ->
          {horizontal, depth + d}

        {:up, d} ->
          {horizontal, depth - d}
      end

    do_calc_position(tail, h, d)
  end

  def calc_position_with_aim(directions), do: do_calc_position_with_aim(directions, 0, 0, 0)

  defp do_calc_position_with_aim([], horizontal, depth, _aim), do: horizontal * depth

  defp do_calc_position_with_aim([head | tail], horizontal, depth, aim) do
    {h, d, new_aim} =
      case head do
        {:forward, h} ->
          {horizontal + h, depth + h * aim, aim}

        {:down, d} ->
          {horizontal, depth, aim + d}

        {:up, d} ->
          {horizontal, depth, aim - d}
      end

    do_calc_position_with_aim(tail, h, d, new_aim)
  end

  def parse_input(filename) do
    filename
    |> Input.read()
    |> Enum.map(fn line ->
      [dir | dist_str] = Regex.run(~r/(\w+) (\d+)/, line, capture: :all_but_first)
      dist = dist_str |> hd() |> String.to_integer()

      case dir do
        "forward" -> {:forward, dist}
        "down" -> {:down, dist}
        "up" -> {:up, dist}
      end
    end)
  end
end
