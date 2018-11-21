feature 'valididating url' do
  scenario 'it ensures that an url is valid' do
  visit('/bookmarks')
  fill_in('url', with: 'not a real bookmark')
  click_button('Submit')
  expect(page).to have_content "Not a valid URL"
  end
end
