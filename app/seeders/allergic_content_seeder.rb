# ColorSeeder
class AllergicContentSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'AllergicContent',
      pts: creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        ingredient_id: Ingredient.all.sample.id,
        good_id:       Good.all.sample.id
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
