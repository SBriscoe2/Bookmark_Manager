feature 'valididating url' do
  scenario 'it ensures that an url is valid' do
  visit('/bookmarks')
  fill_in('url', with: 'htp://testbookmark.com')
  expect(page).to have_content "Not a valid URL"
  end
end
