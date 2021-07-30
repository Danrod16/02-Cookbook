class View
  def ask_user(attr)
    puts "what is the #{attr} of the recipe"
    gets.chomp
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}-#{recipe.name}: #{recipe.description}"
    end
  end
end
