require_relative 'view'
require_relative 'recipe'


class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end
  #CRUD
  def create
    name = @view.ask_user("name")
    description = @view.ask_user("description")
    recipe = Recipe.new(name, description)
    @cookbook.add(recipe)
  end

  def list
    display_recipes
  end

  def destroy
    display_recipes
    recipe = @view.ask_user("index")
    @cookbook.remove(recipe.to_i - 1)
  end

  private

  def display_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end
end
