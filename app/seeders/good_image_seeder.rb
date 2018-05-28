# IngredientSeeder
class GoodImageSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'GoodImage',
      pts:  creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        image: 'test.com',
        good_id: Good.all.sample.id
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
