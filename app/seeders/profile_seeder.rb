# GoodSeeder
class ProfileSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      :name  => "Profile",
      :pts   => creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        user_id: 1,
        country_id: 1,
        province_id: 1,
        district_id: 1,
        sub_district_id: 1,
        first_name: 'test',
        last_name: 'test',
        postal_code: 'test',
        address1: 'test',
        address2: 'test',
        tel: 'test',
        email: 'test',
        photo: 'test'
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
