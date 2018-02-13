# GoodCategorySeeder
class GoodsCategorySeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'GoodsCategory',
      pts:  creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        name: %w[Shampoo Perfume Soap BodySoap].sample
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
