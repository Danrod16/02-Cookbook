require 'csv'
require_relative 'recipe'
class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load_csv
  end
#CRUD

  def all
    @recipes
  end

  def add(recipe)
    @recipes << recipe
    save_to_csv
  end

  def remove(recipe_index)
    @recipes.delete_at(recipe_index)
    save_to_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |recipe|
      @recipes << Recipe.new(recipe[0], recipe[1])
    end
  end

  def save_to_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
       csv << [recipe.name, recipe.description]
      end
    end
  end
end
