# UserSeeder
class UserSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'User',
      pts:  creating_pts
    })
  end

  def make
    to_string

    (@pts / 4).times do |i|
      customer = @model.new(email: "customer#{i}@suneikii.com", password: 'password')
      customer.role = :customer
      customer.skip_confirmation!
      customer.save

      provider = @model.new(email: "provider#{i}@suneikii.com", password: 'password')
      provider.role = :provider
      provider.skip_confirmation!
      provider.save

      staff = @model.new(email: "staff#{i}@suneikii.com", password: 'password')
      staff.role = :staff
      staff.skip_confirmation!
      staff.save

      admin = @model.new(email: "admin#{i}@suneikii.com", password: 'password')
      admin.role = :admin
      admin.skip_confirmation!
      admin.save
    end

    to_string(false)
  end
end
