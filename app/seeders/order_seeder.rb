# GoodSeeder
class OrderSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      :name  => "Order",
      :pts   => creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        ordered_on: Time.zone.today,
        user_id: User.all.sample.id,
        total_amount: 20000.0,
        shipping_cost: 200.00,
        tax: 10,
        note: 'test',
        tracking_no: 'test'
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
