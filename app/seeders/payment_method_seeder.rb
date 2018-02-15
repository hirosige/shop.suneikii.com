# GoodSeeder
class PaymentMethodSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      :name  => "PaymentMethod",
      :pts   => creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        name: 'test',
        account_number: 'teasfasdf',
        account_name: 'test'
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
