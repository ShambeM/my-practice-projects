defmodule GuessingGame do
  #THANKS DAD!
  #I want to modify this to get it to guess between the number a user puts and the min/max
  # def bigger(min, max) do
  # new_min = min max, mid(min, max) + 1
  # guess(new_min, max)
  #end
  #def smaller(min, max) do
  # new_max = max(min, mid(min, max) - 1)
  # guess(min, new_max)
  #end
  def start_game do
    play_game(1, 200, :rand.uniform(100))
  end
  def play_game(min, max, number) do
    IO.puts "please enter a number between #{min} and #{max}"
    guess = IO.gets("") |> to_string() |> String.trim()


    case String.to_integer(guess) do
      n when n < min ->
        IO.puts "the number is too small"
        play_game(min, max, number)
      n when n > max ->
        IO.puts "the number is too big"
        play_game(min, max, number)
      n when n < number ->
        IO.puts "the number is too small"
        play_game(min, max, number)
      n when n > number ->
        IO.puts "the number is too big"
        play_game(min, max, number)
      n when n == number ->
        IO.puts "congratulations! You're the Bee's Knees:)"
    end
  end
end
