defmodule Engine do
  @title "The Adventure"
  @author "Maajidah Hall-Shambe"

  @game_states %{
    :the_introduction => %{
      state: :the_introduction,
      message: "Please choose a place to start: The Forest, The City, or The Island",
      choices: [
        %{
          choice: "forest",
          chosen_message: "You have chosen the Forest",
          next_state: :the_forest
        },
        %{
          choice: "city",
          chosen_message: "You have chosen the City",
          next_state: :the_city
        },
        %{
          choice: "island",
          chosen_message: "You have chosen the Island",
          next_state: :the_island
        }
      ]
    },
    :the_forest => %{
      state: :the_forest,
      message:
        "You walk up to the entrance of the Forest at the edge of your town. It is dark, and the air is thick. You look down, and see a flashlight and a lighter waiting to be chosen.",
      choices: [
        %{
          choice: "flashlight",
          chosen_message:
            "you pick up the flashlight, and watch the lighter sink into the grass. You try to turn it on as you breach the threshold of the Forest, but looks like the battery is dead.
        Without paying attention, you trip over a tree root and hit your head. Game over.",
          next_state: :try_again
        },
        %{
          choice: "lighter",
          chosen_message:
            "you pick up the lighter, and watch the flashlight sink into the grass. you flick it on, but still can't see much, but choose to carry on past the threshold of the Forest.",
          next_state: :make_torch
        }
      ]
    },
    :make_torch => %{
      message:
        "After a minute of walking, you find a dead tree with many branches that can be used to make a torch.
  You snap one off and start to contimplate whether you should wrap the top of it in your shirt or not... what do you choose?",
      choices: [
        %{
          choice: "shirt",
          chosen_message:
            "you wrap the top of the branch with your shirt and light it with the lighter. You now are able to see a lot more of your surroundings and continue deeper into the Forest.",
          next_state: :choose_sound
        },
        %{
          choice: "no shirt",
          chosen_message:
            "You decide to keep your shirt on, and light the dead branch. As it illuminates a little bit more of your surroundings, you see a wolf in front of you.
      Before you have a chance to react, it attacks you. Game over.",
          next_state: :try_again
        }
      ]
    },
    :choose_sound => %{
      message:
        "As your walking through dense bushes, you hear 2 distinct noises; one of rushing water, and one of voices. They are in opposite directions... Which do you choose to follow?",
      choices: [
        %{
          choice: "water",
          chosen_message:
            "you follow the sounds of water until you reach a water fall spilling into a lake. It's lit by thousands of fireflies that seem to dance around.
    You have found the Paradise lake of the Forest. You are among winners, and can relax now. Good job!",
          next_state: :thank_you
        },
        %{
          choice: "voices",
          chosen_message:
            "You follow the sounds of voices until you stumble upon a village. Everyone talking stops and turns to you; They seem alarmed.
     You start to raise your hands slowly to show you are not dangerous, and someone near starts screaming.
     As you turn to look at them, you are hit with a rock. Game over.",
          next_state: :try_again
        }
      ]
    },
        :try_again => %{
      message:
        "would you like to try again?",
      choices: [
        %{
          choice: "try again",
          chosen_message:
            "I wish you better luck",
          next_state: :thank_you
        },
        %{
          choice: "quit",
          chosen_message:
            "The End is here",
          next_state: :game_over
        }
      ]
    },
    :thank_you => %{
      state: :thank_you,
      message: "Thank you for playing. <3 This game is brought to you by #{@author}.\n"
    },
    :game_over => %{
      state: :game_over,
      message: " Thank you for playing\n"
    },
    :the_city => %{
      state: :the_city,
      message:
        "You drive into The City. You have driven for 2 hours and need to find a gas station.",
      choices: [
        %{
          choice: "gps",
          chosen_message:
            "You pull out your phone while driving and immediately crash into a tree. Game over.",
          next_state: :try_again
        },
        %{
          choice: "drive",
          chosen_message:
            "After 5 more mintutes of driving, you pull into a deserted gas station that doesnt look very inviting. You stop at a pump and notice that the gas prices are at least low.",
          next_state: :gas_station
        }
      ]
    },
    :gas_station => %{
      state: :gas_station,
      message:
        "Would you like to pay with card at the pump, or go inside the slightly lit store?",
      choices: [
        %{
          choice: "pump",
          chosen_message:
            "You choose to pay at the pump, and continue on your way into the City.",
          next_state: :choose_path
        },
        %{
          choice: "store",
          chosen_message:
            "You walk into the store and notice that it's completely silent. You find the register to your left. When you walk up to it, you shout for assistance, but no one answers.
       Without you noticing, a poinsonous spider drops on your head and bites you. Game over.",
          next_state: :try_again
        }
      ]
    },
    :choose_path => %{
      state: :choose_path,
      message:
        "You come to a stop at a stop sign, and see 2 paths you can take; the left path leads to a populated highway, and the right path leads to a silent dirt road. Where would you like to go?",
      choices: [
        %{
          choice: "left",
          chosen_message:
            "you get on the highway and notice how beautiful and unique the buildings are. It is an amazing sight that seems to be enjoyed by everyone driving along side you.
       After a while, you start to notice billboards that read 'Welcome to Paradise City'.
        You are among winners, and can now relax. Good Job!",
          next_state: :thank_you
        },
        %{
          choice: "right",
          chosen_message:
            "...ummm, you're supposed to be heading deeper into the City, not away from it... Game over!",
          next_state: :try_again
        }
      ]
    },
    :the_island => %{
      state: :the_island,
      message:
        "You use your boat to cross the seas to The Island. When you step out onto the sand, you take in a quiet view of trees with a large mountain in the background.
   Suddenly, a coconut falls from a tree you are standing next to, and you realise you are really thirsty... Do you want to drink from the coconut or the sea behind you?",
      choices: [
        %{
          choice: "coconut",
          chosen_message: "you picked up the coconut... How are you going to open it?",
          next_state: :open_it
        },
        %{
          choice: "sea",
          chosen_message:
            "you've chosen to drink multiple handfulls of sea water... now your stomach is cramping...a-a-a-and you s-s-start to throw up... Y-You cant see straight... Y-Y-Youre d-d-d-dehydrating rapidly
      ... G...G..Game...Overrr",
          next_state: :try_again
        }
      ]
    },
    :open_it => %{
      state: :open_it,
      message: "A coconut cant be too hard to open, right?",
      choices: [
        %{
          choice: "rock",
          chosen_message:
            "As you bang the coconut on the rock, it starts to crack open, and you drink it. You feel so refreshed... Now where do you go?",
          next_state: :which_path
        },
        %{
          choice: "stick",
          chosen_message:
            "you pry a stick into one of the shallow holes of the coconut... You bend the stick too far and hit yourself... Game Over.",
          next_state: :try_again
        }
      ]
    },
    :which_path => %{
      state: :which_path,
      message:
        "You stare to the left and see the beach continues around a bend. you look right and see huge jagged rocks lining the beach.
  Looking ahead, you see the dense woods and a tall mountain ahead.
  Where do you want to go?",
      choices: [
        %{
          choice: "left",
          chosen_message:
            "you decide to walk the perimeter and find a village of people... Do you speak to them, or walk around the village?",
          next_state: :to_speak
        },
        %{
          choice: "forward",
          chosen_message:
            "you walk into the dense woods. It seems the sun can barely penetrate through the trees, yet it is hot and humid. Soon bugs start buzzing around you as you walk further in.
      One of them bites you on the arm, and you immediately feel dizzy. Looks like it is poisonous, and you pass out. Game over...",
          next_state: :try_again
        }
      ]
    },
    :to_speak => %{
      state: :to_speak,
      message:
        "I wonder what they would say to you, an outsider... Would they be kind? What do you do? ",
      choices: [
        %{
          choice: "speak",
          chosen_message:
            "you walk up to a person sitting calmly by a tree...\n
                        you say 'Hi! I am here to explore... Do you know where I should go?'
                        they say 'Hello stranger. We have not seen an outsider in many years... If you want to explore our Island, you must 1st complete the trials of fear. Would you like to?'\n",
          next_state: :trials_decision
        },
        %{
          choice: "avoid",
          chosen_message:
            "you go around the village, not looking or speaking to anyone... You are determined to explore without help...
      You give one final glance at the village as it become distant and accidentally walk right into quick sand... Game over",
          next_state: :try_again
        }
      ]
    },
    :trials_decision => %{
      state: :trials_decision,
      message:
        "A trial could mean the best adventure quest of your life... or immediate death... What do you choose?",
      choices: [
        %{
          choice: "no thank you",
          chosen_message:
            "you walk away from the villager and around the village. You dont need to complete some trials to go on an adventure.
      You give one final glance at the village as it become distant and accidentally walk right into quick sand... Game over",
          next_state: :try_again
        },
        %{
          choice: "trials",
          chosen_message:
            "you say 'I deem myself brave enough for the trials!' as you pump your fist in the air.
they say '...Okay weirdo... Follow me.'\n
The villager takes you to a set of tall double doors at the other end of the village. You enter with trepidation and nobility in your heart.
  The doors close behind you and throw you in darkness. Slowly, fire lights within firebowls as you turn to this expansive space.
  you see the trials infront on you, and confidence ignites within you...\n",
          next_state: :trial_run
        }
      ]
    },
    :trial_run => %{
      state: :trial_run,
      message:
        "You see two possible routes to get to the other side of the expanisve room in front of you. One path is made up of thick pedestals spaced out over a deep dark pit.
        The other is a horizontal rock climbing wall with holes spiratically placed. I wonder what is in them? which path will you choose?\n ",
      choices: [
        %{
          choice: "wall",
          chosen_message:
            "You decide to use your untapped skill of climbing and approach the wall to the left of you. You wipe the sweat from your brow and start to climb until you approach the first hole.
            You wave your hand over the hole and a poison dart wizzes past... You decide to change climbing techniques and wiggle above or below the next holes that appear...
            You made it to the end of the trial without accident. With heavy breath, you exit the room through another set of double doors.\n
            You collapse in front of a crowd that seemed to gather from the village. The villager that led you to the trial steps out of the croud and helps you up.
            The knowing look on their face shows you that they know exactly what you're thinking...
            The trial was the best adventure you've ever had. You are among winners, and can now relax. Good Job!\n",
          next_state: :thank_you
        },
        %{
          choice: "pedestals",
          chosen_message:
            "You choose to use your untapped skill of jumping and approach the closet pedestal. It looks like, in order to reach it, you will have to get a running start.
            You do so and land directly in the middle of the platform. Now you have even more confidence that you will finish this course with flying colors.
            As you jump from pedestal to pedestal, you start to lose steam. You have 5 more pedestals to jump to, and now it feels like a daunting task.
            You decide to take a moment to catch your breath... As seconds go by, your pedestal starts to lower... Now is the time to move quick and swiftly,
            or else you will be lost forever...\n
            After 3 hours of sweat, blood, and tears, you exit the trial. You collapse in front of a crowd that seemed to gather from the village.
  The villager that led you to the trial steps out of the croud and helps you up. The knowing look on their face shows you that they know exactly what you're thinking...
  The trial was the best adventure you've ever had. You are among winners, and can now relax. Good Job!\n",
          next_state: :thank_you
        }
      ]
    },
  }
  def get_game_states do
    @game_states
  end

  def display_message(@game_states, current_state) do
    state_data = Map.get(@game_states, current_state)
    IO.puts(state_data[:message])
  end

  def start_game do
    IO.puts("== #{@title} ==\n")
    IO.puts("Welcome to #{@title}! please enter your player's name")
    name = IO.gets("") |> to_string() |> String.trim() |> String.capitalize()
    IO.puts(" Thats a great name, #{name}!\n")
    play_game(:the_introduction)
  end

  def play_game(current_state) do
   continue_game(current_state)
  end

  def display_player_options(state_data) do
    IO.puts("Choices:")

    Enum.each(state_data.choices, fn choice ->
      IO.puts("#{choice.choice}")
    end)
  end

  def get_player_choice(state_data) do
    IO.puts("Enter your choices:")
    choice = IO.gets("") |> to_string() |> String.trim()
    Enum.find(state_data.choices, &(&1.choice == choice))
  end

  def handle_choice(%{next_state: next_state, chosen_message: chosen_message}) do
    IO.puts(chosen_message)
    continue_game(next_state)
  end

  def continue_game(next_state) do
    current_state_data = @game_states[next_state]
    display_message(@game_states, next_state)

   if next_state in [:game_over, :thank_you] do
      continue_game(:the_introduction)
    else
      display_player_options(current_state_data)
      player_choice = get_player_choice(current_state_data)

      if player_choice == nil do
        IO.puts("Invalid Choice. Try again")
        continue_game(next_state)
      else
        handle_choice(player_choice)
      end
    end
  end
end
