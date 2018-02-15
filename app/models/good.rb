# == Schema Information
#
# Table name: goods
#
#  id                :integer          not null, primary key
#  shopper_id        :integer
#  goods_category_id :integer
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

  has_many :collection_connections
  has_many :collections, through: :collection_connections

  has_many :color_selections
  has_many :colors, through: :color_selections

  has_many :allergic_contents
  has_many :ingredients, through: :allergic_contents

  has_many :size_selections
  has_many :sizes, through: :size_selections

  has_many :wish_lists
  has_many :ratings

  belongs_to :goods_category
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
