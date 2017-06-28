defmodule BowlingTest do
  use ExUnit.Case

  test "when no rolls, the score is zero" do
    assert Bowling.start_game([]) == 0
  end

  test "a simple game frame" do
    assert Bowling.start_game([7,1]) == 8
  end

  test "when a spare is made, the bonus is the next roll" do
    assert Bowling.start_game([8,2,5]) == 20
  end

  test "when a strike is made, the bonus is the sum of the next two rolls" do
    assert Bowling.start_game([10,5,4]) == 38
  end

  test "a perfect game" do
    assert Bowling.start_game([10,10,10,10,10,10,10,10,10,10,10,10] == 300)
  end
end
