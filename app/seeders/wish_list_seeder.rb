# IngredientSeeder
class WishListSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'WishList',
      pts:  creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        user_id: 1,
        good_id: 1
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
