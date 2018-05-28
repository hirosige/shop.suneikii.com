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
        goods_category_id: GoodsCategory.all.sample.id,
        shopper_id:        Shopper.all.sample.id,
        name:              Faker::Coffee.blend_name,
        thumbnail:         '',
        price:             20000.0,
        description:       Faker::Lorem.sentence,
        gender:            1,
        admin_memo:        Faker::Lorem.paragraph
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
