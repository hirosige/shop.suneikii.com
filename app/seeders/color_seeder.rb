class ColorSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      :name  => "Color",
      :pts   => creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
          :name => Faker::Color.color_name.capitalize
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
