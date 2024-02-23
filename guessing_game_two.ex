defmodule GuessingGame do
    # guess between a low number and a high number - guess middle number
  # tell user our guess
  # "yes" -> game over
  # "bigger" -> bigger(low, high)
  # "smaller" -> smaller(low, high)
  # anything else -> tell user to enter a valid response
  def guess(a, b) when a > b, do: guess(b, a)


  def guess(min, max) do
    guess = mid(min, max)
    IO.puts("hmm... maybe you're thinking of #{guess}?\n")
answer = IO.gets("") |> to_string() |> String.trim()

    case String.trim(answer) do
      "bigger"  ->
        bigger(min, max)
      "smaller" ->
        smaller(min, max)
      "yes" ->
        "I knew I could guess your number!"
      _ ->
        IO.puts ~s{Typer "bigger", "smaller" or "yes"}
        guess(min, max)
    end
  end

def mid(min, max) do
  div(min + max, 2)
end

def bigger(min, max) do
  new_min = min max, mid(min, max) + 1
  guess(new_min, max)
end
def smaller(min, max) do
  new_max = max(min, mid(min, max) - 1)
  guess(min, new_max)
end
end
