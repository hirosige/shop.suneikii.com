# == Schema Information
#
# Table name: carts
#
#  id           :integer          not null, primary key
#  total_amount :decimal(16, 3)
#  status       :string(255)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Cart < ApplicationRecord
  validates :user_id, :presence => true

  has_many :cart_contents

  state_machine :status, :initial => :active do
    state :active
    state :inactive

    event :inactivate do
      transition :from => :active, :to => :inactive
    end
  end

  def add_item(good_id)
    self.cart_contents.build(
        :good_id    => good_id,
        :pts        => 1,
        :sub_amount => 0.0
    )

    self.cart_contents.each do |item|
      item.calc_sub_amount
    end
  end

  def remove_item(cart_content_id)
    CartContent.find(cart_content_id).destroy
    self.reload
  end

  def change_quantity(cart_content_id, quantity)
    self.cart_contents.map do |item|
      item.change_quantity(quantity) if item.id == cart_content_id
    end
  end
end
