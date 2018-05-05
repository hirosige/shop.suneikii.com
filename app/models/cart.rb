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
  validates :user_id, presence: true

  has_many :cart_contents
  belongs_to :user

  state_machine :status, initial: :active do
    state :active
    state :inactive

    event :inactivate do
      transition from: :active, to: :inactive
    end
  end

  def size
    cart_contents.size
  end

  def contents(index)
    cart_contents[index]
  end

  def add_item(good_id)
    cart_contents.build( good_id: good_id, pts: 1, sub_amount: 0.0)

    cart_contents.each(&:calc_sub_amount)
    calc_total

    save
  end

  def remove_item(cart_content_id)
    CartContent.find(cart_content_id).destroy
    reload
  end

  def change_pts(params)
    cart_content = CartContent.find(params[:id])
    cart_content.change_pts(params[:pts])

    cart_contents.each(&:reload)
    calc_total

    save
  end


  def calc_total
    self.total_amount = cart_contents.sum { |attr| attr[:sub_amount]}
  end
end
