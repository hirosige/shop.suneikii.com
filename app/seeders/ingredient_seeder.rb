# IngredientSeeder
class IngredientSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'Ingredient',
      pts:  creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        name: Faker::Food.ingredient
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
