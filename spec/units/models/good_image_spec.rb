# == Schema Information
#
# Table name: good_images
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe GoodImage, type: :model do
  let(:mdl) { 'good_image' }
  let(:image) { AttrValue.attr("#{mdl}.image") }
  let(:good_id) { AttrValue.attr("#{mdl}.good_id") }

  it 'can create' do
    good_image = build(:good_image, :img1)
    expect(good_image.valid?).to eq true
  end

  it 'can upload images files' do
    png  = build(:good_image, :can_upload_png)
    jpg  = build(:good_image, :can_upload_jpg)
    jpeg = build(:good_image, :can_upload_jpeg)
    gif  = build(:good_image, :can_upload_gif)

    expect(png.valid?).to eq true
    expect(jpg.valid?).to eq true
    expect(jpeg.valid?).to eq true
    expect(gif.valid?).to eq true
  end

  it 'cant upload other files' do
    pdf = build(:good_image, :can_upload_pdf)
    expect(pdf.valid?).to eq false
    expect(pdf.errors.full_messages).to include image_black_list(image)
  end

  it 'can show image url' do
    base_url  = '/uploads/good_image/image/1'
    file_name = 'test.png'
    pdf = create(:good_image, :can_upload_png)
    expect(pdf.image.url).to eq "#{base_url}/#{file_name}"
    expect(pdf.image.thumb.url).to eq "#{base_url}/thumb_#{file_name}"
    expect(pdf.image.middle.url).to eq "#{base_url}/middle_#{file_name}"
    expect(pdf.image.large.url).to eq "#{base_url}/large_#{file_name}"
  end

  it 'can add many images' do
    good = create(:good, :a)
    create(:good_image, :can_upload_png, good_id: good.id)
    create(:good_image, :can_upload_png, good_id: good.id)
    create(:good_image, :can_upload_png, good_id: good.id)
    create(:good_image, :can_upload_png, good_id: good.id)
    create(:good_image, :can_upload_png, good_id: good.id)
    create(:good_image, :can_upload_png, good_id: good.id)

    expect(good.good_images.size).to eq 6
  end
end
