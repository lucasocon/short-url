require 'rails_helper'

feature 'create new url' do
  let(:new_url_form) { Url.new }

  scenario 'create new url with valid data', js: true do
    visit root_path
    within("#urls-form") do
      fill_in 'long_url', with: 'https://google.com'
    end
    click_button 'Generate Url'
    expect(page).to have_css('a', text: 'https://google.com')
  end

  scenario 'cannot create url with invalid data', js: true do
    visit root_path
    within("#urls-form") do
      fill_in 'long_url', with: 'Fail'
    end
    click_button 'Generate Url'
    expect(page).to have_content("Impossible to create the short-url, Url invalidates")
  end
end