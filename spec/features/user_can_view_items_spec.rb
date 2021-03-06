require 'rails_helper'

RSpec.describe 'User', type: :feature do
  create_category
  create_brand
  create_items
  feature 'Item' do
    it 'can view an item by clicking item name from items index' do
      visit items_path
      click_link "#{item_one.name}"

      expect(current_path).to eq(item_path(item_one))
      expect(page).to have_content(item_one.name)
      expect(page).to have_content(item_one.description)
      expect(page).to have_content("$#{item_one.price} per day")
      expect(page).to have_css("img[src*='http://www.bhphotovideo.com/images/images1000x1000/sony_sel1635z_vario_tessar_t_e_16_35mm_1082052.jpg']")
    end
  end
  feature 'Item' do
    it 'can view an item by clicking item picture from items index' do
      visit items_path
      click_link "image_#{item_one.id}"

      expect(current_path).to eq(item_path(item_one))
      expect(page).to have_content(item_one.name)
      expect(page).to have_content(item_one.description)
      expect(page).to have_content("$#{item_one.price} per day")
      expect(page).to have_css("img[src*='http://www.bhphotovideo.com/images/images1000x1000/sony_sel1635z_vario_tessar_t_e_16_35mm_1082052.jpg']")
    end
  end
  feature 'Item' do
    it 'can view an item by clicking item name from categories index' do
      visit "/#{category.name}"
      click_link "#{item_one.name}"

      expect(current_path).to eq(item_path(item_one))
      expect(page).to have_content(item_one.name)
      expect(page).to have_content(item_one.description)
      expect(page).to have_content("$#{item_one.price} per day")
      expect(page).to have_css("img[src*='http://www.bhphotovideo.com/images/images1000x1000/sony_sel1635z_vario_tessar_t_e_16_35mm_1082052.jpg']")
    end
  end
  feature 'Item' do
    it 'can view an item by clicking item picture from categories index' do
      visit "/#{category.name}"
      click_link "image_#{item_one.id}"

      expect(current_path).to eq(item_path(item_one))
      expect(page).to have_content(item_one.name)
      expect(page).to have_content(item_one.description)
      expect(page).to have_content("$#{item_one.price} per day")
      expect(page).to have_css("img[src*='http://www.bhphotovideo.com/images/images1000x1000/sony_sel1635z_vario_tessar_t_e_16_35mm_1082052.jpg']")
    end
  end

end
