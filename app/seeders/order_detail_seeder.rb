# GoodSeeder
class OrderDetailSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      :name  => "OrderDetail",
      :pts   => creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        order_id: 1,
        good_id: 1,
        qty: 1,
        sub_total: 20000.0
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
