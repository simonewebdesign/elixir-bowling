defmodule Bowling do

  def start_game([]), do: 0
  def start_game(rolls) do
    initial_state = %{
      score: 0,        # total score
      bonus: nil,      # either :strike, :spare, or nil
      half_frame: nil  # meta score
    }
    %{score: final_score} = Enum.reduce(rolls, initial_state, fn roll, state ->
      case hd(rolls) do
        10 -> # strike!
          %{state |
            score: state.score + 10,
            bonus: :strike
          }

        _ ->
          case state.half_frame do
            nil ->
              %{state |
                half_frame: roll
              }

            _ ->
              frame_score = state.half_frame + roll
              if frame_score == 10 do
                # spare!
                %{state |
                  score: state.score + frame_score,
                  bonus: :spare
                }
              else
                %{state |
                  score: state.score + frame_score
                }
              end
          end
      end
    end)
    final_score
  end

end
