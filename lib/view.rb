class View
  def ask_user(attr)
    puts "what is the #{attr} of the recipe"
    gets.chomp
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      status = recipe.done? ? "[X]" : "[ ]"
      puts "#{index + 1}. #{status} #{recipe.name}: #{recipe.description} - #{recipe.rating}/5 - #{recipe.prep_time}"
    end
  end
end
