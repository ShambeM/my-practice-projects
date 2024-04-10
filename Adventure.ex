defmodule Adventure do

#choose your own adventure
#injury will lead to game over
#Updates will be spiratic but grand

  def play_game() do
    IO.puts "Welcome to your adventure! please choose a place to start: The Forest, The City, or The Island"
    place = IO.gets("") |> to_string() |> String.trim() |> String.downcase()

    case place do
      "the forest" ->
          IO.puts "You walk up to the entrance of The Forest at the edge of your town. It is dark, and the air is thick. You look down, and see a flashlight and a lighter waiting to be chosen."
          choose_light()
          "the city" ->
          IO.puts "You drive into The City. You have driven for 2 hours and need to find a gas station."
          choose_route()
      "the island" ->
          IO.puts "You use your boat to cross the seas to The Island. When you step out onto the sand, you take in a quiet view of trees, and a mountain. Suddenly, a coconut falls from a tree you are standing next to and knocks you out. Game over."
          try_again()
       _ ->
          IO.puts "Invalid choice. Please choose The Forest, The City, or The Island."
          play_game()
        end
  end

  def try_again() do
    IO.puts "Would you like to try again? (yes/no)"
    answer = IO.gets("") |> to_string() |> String.trim() |> String.downcase()

    case answer do
      "yes" ->
        IO.puts "Good luck!"
        play_game()
      "no" ->
        IO.puts "Thanks for playing!"
      _ ->
        IO.puts "Invalid input. Please enter 'yes' or 'no'."
        try_again()
      end
    end

    def choose_route() do
      IO.puts "Do you use GPS to find one or continue to drive until you see one?"
      route = IO.gets("") |> to_string() |> String.trim() |> String.downcase()

      case route do
        "gps" ->
          IO.puts " You pull out your phone while driving and immediately crash into a tree. Game over."
          try_again()
        "drive" ->
          IO.puts "After 5 more mintutes of driving, you pull into a deserted gas station that doesnt look very inviting. You stop at a pump and notice that the gas prices are at least low."
          gas_station()
        _ ->
           IO.puts "Invalid input. Please enter 'gps' or 'drive'."
          choose_route()
      end
    end

    def choose_light() do
      IO.puts " You must choose your source of light, but choose carefully, because the other will disappear..."
      light = IO.gets("") |> to_string() |> String.trim() |> String.downcase()

      case light do
        "flashlight" ->
          IO.puts "you pick up the flashlight, and watch the lighter sink into the grass. you try to turn it on as you breach the threshold of the Forest, and looks like the battery is dead. Without paying attention, you trip over a tree root and hit your head. Game Over."
          try_again()
        "lighter" ->
          IO.puts " you pick you the lighter, and watch the flashlight sink into the grass. you flick it on but still cant see much, but choose to carry on past the threshold of the Forest."
          make_torch()
        _ ->
          IO.puts " Invalid input. Please enter 'flashlight' or 'lighter'."
          choose_light()
      end
    end

    def gas_station() do
      IO.puts "Would you like to pay with card at the pump, or go inside the slightly lit store?"
      pay = IO.gets("") |> to_string() |> String.trim() |> String.downcase()

      case pay do
        "pump" ->
          IO.puts "You choose to pay at the pump, and continue on your way into the City."
          choose_path()
        "store" ->
          IO.puts "You walk into the store and notice that it's completely silent. You find the register to your left. When you walk up to it, you shout for assistance, but no one answers. Without you noticing, a poinsonous spider drops on your head and bites you. Game over."
          try_again()
        _ ->
          IO.puts " Invalid input. Please enter 'pump' or 'store'."
          gas_station()
      end
    end

    def make_torch() do
      IO.puts " after a minute of walking, you find a dead tree with many branches that can be used to make a torch. You snap one off and start to contimplate whether you should wrap the top of it in your shirt or not... what do you choose?"
      torch = IO.gets("") |> to_string() |> String.trim() |> String.downcase()

       case torch do
         "shirt" ->
          IO.puts "you wrap the top of the branch with your shirt and light it with the lighter. You now are able to see a lot more of your surroundings and continue deeper into the Forest."
          choose_sound()
          "no shirt" ->
            IO.puts " You decide to keep your shirt on, and light the dead branch. As it illuminates a little bit more of your surroundings, you see a wolf in front of you. Before you have a chance to react, it attacks you. Game over."
          _ ->
            IO.puts "Invalid input. Please enter 'shirt' or 'no shirt'."
            make_torch()
       end
    end
    def choose_path() do
      IO.puts "You come to a stop at a stop sign, and see 2 paths you can take; the left path leads to a populated highway, and the right path leads to a silent dirt road. Where would you like to go? "
      path = IO.gets("") |> to_string() |> String.trim() |> String.downcase()

      case path do
        "left" ->
          IO.puts " you get on the highway and notice how beautiful and unique the buildings are. It is an amazing sight that seems to be enjoyed by everyone driving along side you. After a while, you start to notice billboards that read 'Welcome to Paradise City'. You are among winners, and can now relax. Good Job!"
         "right" ->
          IO.puts "...ummm, you're supposed to be heading deeper into the City, not away from it... Game over!"
          try_again()
        _ ->
          IO.puts "Invalid input. Please enter 'left' or 'right'."
          choose_path()
      end
    end

    def choose_sound() do
        IO.puts " As your walking through dense bushes, you hear 2 distinct noises; one of rushing water, and one of voices. They are in opposite directions... Which do you choose to follow?"
        sound = IO.gets("") |> to_string() |> String.trim() |> String.downcase()

        case sound do
          "water" ->
            IO.puts " you follow the sounds of water until you reach a water fall spilling into a lake. It's lit by thousands of fireflies that seem to dance around. You have found the Paradise lake of the Forest. You are among winners, and can relax now. Good job!"
          "voices" ->
            IO.puts "You follow the sounds of voices until you stumble upon a village. Everyone talking stops and turns to you; They seem alarmed. You start to raise your hands slowly to show you are not dangerous, and someone near starts screaming. As you turn to look at them, you are hit with a rock. Game over."
            try_again()
          _ ->
            IO.puts "Invalid input. Please enter 'water' or 'voices'."
        end
    end
end
