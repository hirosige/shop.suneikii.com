# IngredientSeeder
class CartSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'Cart',
      pts:  creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        total_amount: 1,
        user_id: User.all.sample.id
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
