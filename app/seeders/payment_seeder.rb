# GoodSeeder
class PaymentSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      :name  => "Payment",
      :pts   => creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        order_id: 1,
        payment_method_id: 1,
        evidence: 'test',
        paid_at: Time.zone.today
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
