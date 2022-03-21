defmodule Day2Test do
  use ExUnit.Case

  describe "part 1" do
    test "it should calc the final position" do
      directions = [
        {:forward, 5},
        {:down, 5},
        {:forward, 8},
        {:up, 3},
        {:down, 8},
        {:forward, 2}
      ]

      pos = Day2.calc_position(directions)

      assert pos == 150
    end

    test "it should calc the final position from the input" do
      directions = Day2.parse_input("inputs/day_2")

      pos = Day2.calc_position(directions)

      assert pos == 1_604_850
    end
  end

  describe "part 2" do
    test "it should calc the final position with aim" do
      directions = [
        {:forward, 5},
        {:down, 5},
        {:forward, 8},
        {:up, 3},
        {:down, 8},
        {:forward, 2}
      ]

      pos = Day2.calc_position_with_aim(directions)

      assert pos == 900
    end

    test "it should calc the final position with aim from the input" do
      directions = Day2.parse_input("inputs/day_2")

      pos = Day2.calc_position_with_aim(directions)

      assert pos == 1_685_186_100
    end
  end
end
