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

class Cart < ActiveRecord::Base
  validates :user_id, :presence => true

  has_many :cart_contents

  state_machine :status, :initial => :on_going do
    state :on_going
    state :done

    event :fix do
      transition :from => :on_going, :to => :done
    end
  end

  def add_item(good_id)
    self.cart_contents.build(
        :good_id => good_id,
        :pts     => 1,
        :sub_amount => 0.0
    )

    self.cart_contents.each do |item|
      item.calc_sub_amount
    end
  end
end
