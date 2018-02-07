class SizeSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      :name  => "Size",
      :pts   => creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
          :name => ["XS", "SS", "S", "M", "L", "LL", "XL"].sample
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
