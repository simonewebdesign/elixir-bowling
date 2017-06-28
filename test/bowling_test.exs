defmodule BowlingTest do
  use ExUnit.Case

  test "when no rolls, the score is zero" do
    assert Bowling.start_game([]) == 0
  end

  test "one roll" do
    assert Bowling.start_game([3]) == 3
  end

  test "a simple game frame" do
    assert Bowling.start_game([7,1]) == 8
  end

  test "three rolls, or one frame and a half" do
    assert Bowling.start_game([7,1,3]) == 11
  end

  test "two simple game frames" do
    assert Bowling.start_game([7,1,3,2]) == 13
  end

  test "when a spare is made, the bonus is the next roll" do
    assert Bowling.start_game([8,2,5]) == 20
  end

  test "when a strike is made, the bonus is the sum of the next two rolls" do
    assert Bowling.start_game([10,5,4]) == 28
  end

  test "double strike!" do
    assert Bowling.start_game([10,10]) == 30
  end

  test "a perfect game" do
    assert Bowling.start_game([10,10,10,10,10,10,10,10,10,10,10,10] == 300)
  end
end
