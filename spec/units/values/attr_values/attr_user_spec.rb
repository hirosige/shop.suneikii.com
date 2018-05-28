# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  uid                    :string(255)
#  provider               :string(255)
#  shopper_id             :integer
#  role                   :string(255)      default("customer"), not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe 'Attr Site' do
  let(:id) { I18n.t('activerecord.attributes.user.id') }
  let(:email) { I18n.t('activerecord.attributes.user.email') }
  let(:encrypted_password) { I18n.t('activerecord.attributes.user.encrypted_password') }
  let(:reset_password_token) { I18n.t('activerecord.attributes.user.reset_password_token') }
  let(:reset_password_sent_at) { I18n.t('activerecord.attributes.user.reset_password_sent_at') }
  let(:remember_created_at) { I18n.t('activerecord.attributes.user.remember_created_at') }
  let(:sign_in_count) { I18n.t('activerecord.attributes.user.sign_in_count') }
  let(:current_sign_in_at) { I18n.t('activerecord.attributes.user.current_sign_in_at') }
  let(:last_sign_in_at) { I18n.t('activerecord.attributes.user.last_sign_in_at') }
  let(:current_sign_in_ip) { I18n.t('activerecord.attributes.user.current_sign_in_ip') }
  let(:last_sign_in_ip) { I18n.t('activerecord.attributes.user.last_sign_in_ip') }
  let(:confirmation_token) { I18n.t('activerecord.attributes.user.confirmation_token') }
  let(:confirmed_at) { I18n.t('activerecord.attributes.user.confirmed_at') }
  let(:unconfirmed_email) { I18n.t('activerecord.attributes.user.unconfirmed_email') }
  let(:uid) { I18n.t('activerecord.attributes.user.uid') }
  let(:provider) { I18n.t('activerecord.attributes.user.provider') }
  let(:shopper_id) { I18n.t('activerecord.attributes.user.shopper_id') }
  let(:role) { I18n.t('activerecord.attributes.user.role') }
  let(:created_at) { I18n.t('activerecord.attributes.user.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.user.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('user.id')).to eq id
    expect(AttrValue.attr('user.email')).to eq email
    expect(AttrValue.attr('user.encrypted_password')).to eq encrypted_password
    expect(AttrValue.attr('user.reset_password_token')).to eq reset_password_token
    expect(AttrValue.attr('user.reset_password_sent_at')).to eq reset_password_sent_at
    expect(AttrValue.attr('user.remember_created_at')).to eq remember_created_at
    expect(AttrValue.attr('user.sign_in_count')).to eq sign_in_count
    expect(AttrValue.attr('user.current_sign_in_at')).to eq current_sign_in_at
    expect(AttrValue.attr('user.last_sign_in_at')).to eq last_sign_in_at
    expect(AttrValue.attr('user.current_sign_in_ip')).to eq current_sign_in_ip
    expect(AttrValue.attr('user.last_sign_in_ip')).to eq last_sign_in_ip
    expect(AttrValue.attr('user.confirmation_token')).to eq confirmation_token
    expect(AttrValue.attr('user.confirmed_at')).to eq confirmed_at
    expect(AttrValue.attr('user.unconfirmed_email')).to eq unconfirmed_email
    expect(AttrValue.attr('user.uid')).to eq uid
    expect(AttrValue.attr('user.provider')).to eq provider
    expect(AttrValue.attr('user.shopper_id')).to eq shopper_id
    expect(AttrValue.attr('user.role')).to eq role
    expect(AttrValue.attr('user.created_at')).to eq created_at
    expect(AttrValue.attr('user.updated_at')).to eq updated_at
  end
end
