defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  describe "part 1" do
    test "it should count the depth measurement increases" do
      input = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

      num_increases = Day1.count_increases(input)

      assert num_increases == 7
    end

    test "it should count the increases from the input" do
      num_increases =
        "inputs/day_1"
        |> Day1.parse_input()
        |> Day1.count_increases()

      assert num_increases == 1342
    end
  end

  describe "part 2" do
    test "it should count the increases with a summing window" do
      input = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

      num_increases = Day1.count_increases_with_window(input)

      assert num_increases == 5
    end

    test "it should count the increases from the input" do
      num_increases =
        "inputs/day_1"
        |> Day1.parse_input()
        |> Day1.count_increases_with_window()

      assert num_increases == 1378
    end
  end
end
