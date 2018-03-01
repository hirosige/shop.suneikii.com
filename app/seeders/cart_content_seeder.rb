# IngredientSeeder
class CartContentSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'CartContent',
      pts:  creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        good_id: Good.all.sample.id,
        pts: 1,
        sub_amount: 20000.0,
        cart_id: Cart.all.sample.id
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
