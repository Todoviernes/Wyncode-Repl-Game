# lemonade stand repl game
#
puts "Welcome to Lemonade Stand!"
puts
puts "Would you like to take over the lemonade stand? yes or no?"
user_choice = gets.chomp
puts
until ["yes", "no"].include? user_choice
  puts "You need to type in either yes or no (capitalization matters). Please enter now."
  user_choice = gets.chomp
  puts
end
if user_choice == "no"
  puts "Have a fabulous day. Goodbye."
  puts
else
  puts "Thank you for joining Lemonade Stand! You will begin with $10 in your pocket."
  sleep 1
  money = 10
  puts
  puts "Are you ready to begin your adventure? yes or no"
  user_input = gets.chomp
  until ["yes", "no"].include? user_input
    puts "You must type in either yes or no (capitalization matters). Please enter now."
    user_input = gets.chomp
    puts
  end
  if user_input == "no"
    puts "Have a fabulous day. Goodbye."
    puts
  else
    puts
    puts "Beginning Round 1..."
    sleep 1
    puts
    puts "Hit space bar and then enter to continue."
    user_input = gets.chomp
    puts
    until [" "].include? user_input
      puts "You much hit the space bar and then enter. Please do so now."
      user_input = gets.chomp
      puts
    end
    puts "You must buy cups, lemons, ice, and sugar to make your lemonade."
    puts "You will begin with 10 of each in this round. You must buy them before the next levels begin."
    sleep 2
    inventory = { cups: 10, lemons: 10, ice: 10, sugar: 10 }
    inv_arr = [inventory[:cups], inventory[:lemons], inventory[:ice], inventory[:sugar]]
    puts
    cups_bought = (1..10).to_a
    puts "How much do you want to sell each cup of lemonade for? (a negative value will be changed to positive)."
    puts "The more you charge, the less likely customers will want to buy a cup."
    # puts "(Please don't put anything other than a number, i haven't figured out a way to fix that error yet.)"
    cost_cup = (gets.chomp).to_f.round(2).abs
    until cost_cup != 0 && cost_cup != nil
      puts "you must put in only a number. Please do so now."
      cost_cup = (gets.chomp).to_f.round(2).abs
    end
    puts
    puts "Day beginning.."
    sleep 2
    puts
    if cost_cup <= 2
      cups_bought = (6..10).to_a
      puts "Customers were very happy with your price for a cup of lemonade."
    elsif cost_cup > 2 && cost_cup < 3
      cups_bought = (3..7).to_a
      puts "Most customers felt your pricing was ok."
    elsif cost_cup >= 3 && cost_cup < 5
      cups_bought = (1..3).to_a
      puts "Most customers thought your pricing was a bit high."
    else
      cups_bought = [0]
      puts
      puts "You charged too much and nobody wanted to buy a cup of lemonade."
    end
    sleep 1
    day_sold = cups_bought.sample
    profit = sprintf "$%.2f", (day_sold * cost_cup)
    total = ((day_sold * cost_cup) + money)
    total_mon = sprintf "$%.2f", ((day_sold * cost_cup) + money)
    puts "You sold #{day_sold} cups today and made a profit of #{profit}. Your total money is now #{total_mon}."
    puts
  # inventory = { cups: 10, lemons: 10, ice: 10, sugar: 10 }
    inventory[:cups] = ((inventory[:cups] - day_sold))
    inventory[:lemons] = ((inventory[:lemons] - day_sold))
    inventory[:ice] = ((inventory[:ice] - day_sold))
    inventory[:sugar] = ((inventory[:sugar] - day_sold))
    inv_arr = [inventory[:cups], inventory[:lemons], inventory[:ice], inventory[:sugar]]
    puts "Continue to Round 2? yes or no?"
    user_choice = gets.chomp
    puts
    until ["yes", "no"].include? user_choice
      puts "You need to type in either yes or no (capitalization matters). Please enter now."
      user_choice = gets.chomp
      puts
    end
    if user_choice == "no"
      puts "Thank you for playing. We hope you play again."
      puts
    else
      puts "Your inventory now includes #{inventory[:cups]} cups, #{inventory[:lemons]} lemons, #{inventory[:ice]} quantity of ice, and #{inventory[:sugar]} sugar."
      puts
      sleep 1
      puts "The cost of buying cups is $1.00 for 1 pack of 10 cups: How many packs would you like to buy? Options are: 1, 2, 3, ...100"
      add_cups = (gets.chomp.to_f) * 10
      unless (total - (add_cups/10)).to_f >= 0
        puts "You cannot afford to buy that quantity. Please enter a new quantity to buy"
        add_cups = (gets.chomp.to_f) * 10
      end
    # until (1..100).include? add_cups
    #   puts "You must enter a single number between 1 and 100. Please enter how many packs you would like to buy now."

      inventory[:cups] = (inventory[:cups] + add_cups).to_i
      total = (total - (add_cups/10)).to_f
      total_mon = sprintf "$%.2f", total
      puts "You now have #{inventory[:cups]} cups and are left with #{total_mon}."
      puts
      sleep 1
      puts "The cost of buying lemons is $3.00 for a bag of 10 lemons: How many bags of lemons would you like to buy?"
      add_lemons = (gets.chomp.to_f) * 10
      unless (total - (add_cups/10)).to_f >= 0
        puts "You cannot afford to buy that quantity. Please enter a new quantity to buy"
        add_lemons = (gets.chomp.to_f) * 10
      end
      inventory[:lemons] = (inventory[:lemons] + add_lemons).to_i
      total = (total -((add_lemons/10) * 3)).to_f
      total_mon = sprintf "$%.2f", total
      puts "You now have #{inventory[:lemons]} lemons and you are left with #{total_mon}."
      puts
      sleep 1
      puts "The cost of buying ice is $1.00 for a bag of '10' ice. How many bags of ice would you like to buy?"
      add_ice = (gets.chomp.to_f) * 10
      unless (total - (add_cups/10)).to_f >= 0
        puts "You cannot afford to buy that quantity. Please enter a new quantity to buy"
        add_ice = (gets.chomp.to_f) * 10
      end
      inventory[:ice] = (inventory[:ice] + add_ice).to_i
      total = (total - (add_ice/10)).to_f
      total_mon = sprintf "$%.2f", total
      puts "You now have #{inventory[:ice]} units of ice and are left with #{total_mon}."
      puts
      sleep 1
      puts "The cost of buying sugar is $4.00 for a bag of '10' sugar. How many bags of sugar would you like to buy?"
      add_sugar = (gets.chomp.to_f) * 10
      unless (total - (add_cups/10)).to_f >= 0
        puts "You cannot afford to buy that quantity. Please enter a new quantity to buy"
        add_sugar = (gets.chomp.to_f) * 10
      end
      inventory[:sugar] = (inventory[:sugar] + add_sugar).to_i
      total2 = (total - ((add_sugar/10)*4)).to_f
      total_mon2 = sprintf "$%.2f", total2
      puts "You now have #{inventory[:sugar]} units of ice and are left with #{total_mon2}."
      inv_arr = [inventory[:cups], inventory[:lemons], inventory[:ice], inventory[:sugar]]
      puts
      puts "Round 2 beginning.."
      sleep 1
      puts
      puts "How much do you want to sell each cup of lemonade for? (a negative value will be changed to positive)."
      puts "The more you charge, the less likely customers will want to buy a cup."
      # puts "(Please don't put anything other than a number, i haven't figured out a way to fix that error yet.)"
      cost_cup2 = (gets.chomp).to_f.round(2).abs
      until cost_cup2 != 0 && cost_cup2 != nil
        puts "you must put in only a number. Please do so now."
        cost_cup2 = (gets.chomp).to_f.round(2).abs
      end
    # until cost_cup.is_a? Numeric
    #   puts "You must enter only a number. (examples include either 1.50 or 3). please enter now."
    #   cost_cup = (gets.chomp).to_f.round(2).abs
    # end
      puts
      puts "Day beginning.."
      sleep 2
      puts
      if cost_cup2 <= 2
        cups_bought = (6..10).to_a
        puts "Customers were very happy with your price for a cup of lemonade."
      elsif cost_cup2 > 2 && cost_cup2 < 3
        cups_bought = (3..7).to_a
        puts "Most customers felt your pricing was ok."
      elsif cost_cup2 >= 3 && cost_cup2 < 5
        cups_bought = (1..3).to_a
        puts "Most customers thought your pricing was a bit high."
      else
        cups_bought = [0]
        puts
        puts "You charged too much and nobody wanted to buy a cup of lemonade."
      end
      sleep 1
      day_sold2 = cups_bought.sample
      profit = sprintf "$%.2f", (day_sold2 * cost_cup2)
      total2 = ((day_sold2 * cost_cup2) + total2)
      total_mon2 = sprintf "$%.2f", total2
      puts "You sold #{day_sold2} cups today and made a profit of #{profit}. Your total money is now #{total_mon2}."
      sleep 1
      puts
      puts "Please come back tomorrow, for round 3!"
      puts
    end
  end
end



# puts "Options: look around, smack a prisoner, run away"
# option = gets.chomp
# case option
# when "look around"
#     puts "You see a bunch of angry prisoners and the Joker!"
# when "smack a prisoner"
#     puts "Ouch! What did I ever do to you, man?"
# when "run away"
#     puts "Batman: \"Bats can't run.\""
# else
#     puts "A prisoner punches you in the face."
#     puts "Prisoner: \"Quit messin' around.\""
# end
