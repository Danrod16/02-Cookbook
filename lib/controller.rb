require_relative 'view'
require_relative 'recipe'
require_relative 'scrape_service'


class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end
  #CRUD
  def create
    # 1. Ask user for a name (view)
    name = @view.ask_user("name")
    # 2. Ask user for a description (view)
    description = @view.ask_user("description")
    # 3. Ask user for rating (view)
    rating = @view.ask_user("rating")
    # 4. Ask user for prep time (view)
    prep_time = @view.ask_user("prep_time")
    # 5. Create recipe (model)
    recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    # 6. Store in cookbook (repo)
    @cookbook.add_recipe(recipe)
    # 7. Display
    display_recipes
  end

  def list
    display_recipes
  end

  def destroy
    display_recipes
    recipe = @view.ask_user("index")
    @cookbook.remove(recipe.to_i - 1)
  end

  def import
    # 1. Ask user for a keyword
    term = @view.ask_user("search")
    # 2. Scrape All Recipes
    results = ScrapeService.new(term).scrape
    # 3. Display results
    @view.display(results)
    # 4. Ask for the recipe to import
    index = @view.ask_user("index").to_i
    # 5. Add to cookbook
    @cookbook.add_recipe(results[index])
    # 6. Display
    display_recipes
  end

  def mark_as_done
    # 1. Display recipes
    display_recipes
    # 2. Ask user for an index (view)
    index = @view.ask_user("index").to_i
    # 3. Mark as done and save (repo)
    @cookbook.mark_recipe_as_done(index - 1 )
    # 4. Display recipes
    display_recipes
  end

  private

  def display_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end
end
