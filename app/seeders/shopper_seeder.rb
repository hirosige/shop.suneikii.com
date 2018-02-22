# GoodSeeder
class ShopperSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      :name  => "Shopper",
      :pts   => creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        name: 'test',
        photo: 'test',
        representative_name: Faker::Coffee.blend_name,
        postal_code: 'test',
        address: 'test',
        tel1: 'test',
        tel2: 'test',
        email: 'test@gmail.com',
        memo: 'test'
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
