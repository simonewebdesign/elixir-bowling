defmodule Bowling do

  def start_game([]), do: 0
  def start_game(rolls) do
    initial_state = %{
      score: 0,        # total score
      bonus: nil,      # either :strike, :spare or nil
      # frame: 0         # meta score
      frame: {1, []}   # first is current frame number, second is a list of
                       # frame values, usually 2 (10th frame has 3 values)
    }
    %{score: final_score} = Enum.reduce(rolls, initial_state, fn roll, state ->
      new_state =
        case state.bonus do
          nil ->
            state

          :spare ->
            %{state |
              score: state.score + roll,
              bonus: nil
            }

          :strike ->
            case state.frame do
              0 ->
                %{state |
                  score: state.score + roll
                }
              _ ->
                %{state |
                  score: state.score + state.frame,
                  bonus: nil
                }
            end
        end

      case hd(rolls) do
        10 -> # strike!
          %{new_state |
            score: new_state.score + 10,
            bonus: :strike
          }

        _ ->
          case new_state.frame do
            0 ->
              %{new_state |
                score: new_state.score + roll,
                frame: roll
              }

            _ ->
              if new_state.frame + roll == 10 do
                # spare!
                %{new_state |
                  score: new_state.score + roll,
                  bonus: :spare,
                  frame: 0
                }
              else
                %{new_state |
                  score: new_state.score + roll,
                  frame: 0
                }
              end
          end
      end
    end)
    final_score
  end

end
