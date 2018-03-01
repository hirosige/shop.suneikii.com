# IngredientSeeder
class RatingSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'Rating',
      pts:  creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        user_id: User.all.sample.id,
        good_id: Good.all.sample.id,
        rates: 5.5,
        description: 'test'
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
