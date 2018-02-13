# GoodSeeder
class GoodSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      :name  => "Good",
      :pts   => creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        name:              Faker::Coffee.blend_name,
        description:       Faker::Lorem.sentence,
        memo:              Faker::Lorem.paragraph,
        ingredient_id:     1,
        gender_id:         1,
        goods_category_id: 1,
        color_id:          1,
        size_id:           1,
        shopper_id:        1
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
