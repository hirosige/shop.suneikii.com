# == Schema Information
#
# Table name: goods
#
#  id                :integer          not null, primary key
#  collection_id     :integer
#  shopper_id        :integer
#  goods_category_id :integer
#  color_id          :integer
#  size_id           :integer
#  ingredient_id     :integer
#  name              :string(255)
#  thumbnail         :string(255)
#  price             :decimal(10, 2)
#  description       :string(255)
#  gender            :integer
#  admin_memo        :text(65535)
#  status            :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Good < ApplicationRecord
  has_many :good_images
  belongs_to :ingredient
  belongs_to :gender
  belongs_to :goods_category
  belongs_to :color
  belongs_to :size
  belongs_to :shopper

  state_machine :status, initial: :unreleased do
    state :unreleased
    state :released

    before_transition on: :unreleased, do: :preview_on
    after_transition on: :released, do: :set_public_date

    event :switch_publish do
      transition :from => :unreleased, :to => :released
      transition :from => :released, :to => :unreleased
    end

    def set_public_date
      p 'after transition'
    end

    def preview_on
      p 'before transition'
    end
  end

end
